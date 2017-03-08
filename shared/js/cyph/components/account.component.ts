import {Component, OnInit} from '@angular/core';
import * as Granim from 'granim';
import {States} from '../account/enums';
import {AccountAuthService} from '../services/account-auth.service';
import {AccountService} from '../services/account.service';
import {EnvService} from '../services/env.service';
import {UrlStateService} from '../services/url-state.service';


/**
 * Angular component for the Cyph account screen.
 */
@Component({
	selector: 'cyph-account',
	styleUrls: ['../../css/components/account.css'],
	templateUrl: '../../../templates/account.html'
})
export class AccountComponent implements OnInit {
	/** @see States */
	public states: typeof States	= States;

	/** Indicates whether menu should be displayed. */
	public get menuVisible () : boolean {
		return this.accountAuthService.current !== undefined && [
			States.chat,
			States.contacts,
			States.files,
			States.home,
			States.profile,
			States.settings
		].filter(
			state => state === this.accountService.state
		).length > 0;
	}

	/** @inheritDoc */
	public async ngOnInit () : Promise<void> {
		if (!this.envService.isWeb) {
			/* TODO: HANDLE NATIVE */
			return;
		}

		this.urlStateService.trigger();

		if (!this.envService.coBranded && this.accountService.state !== States.extension) {
			/* tslint:disable-next-line:no-unused-new */
			new Granim({
				direction: 'radial',
				element: '.cyph-gradient',
				isPausedWhenNotInView: true,
				name: 'basic-gradient',
				opacity: [1, 0.5, 0],
				states : {
					'default-state': {
						gradients: [
							['#392859', '#624599'],
							['#9368E6', '#624599']
						],
						loop: true,
						transitionSpeed: 5000
					}
				}
			});
		}

		await this.accountAuthService.ready;

		if (this.accountAuthService.current && this.accountService.state === States.login) {
			this.urlStateService.setUrl('account/home');
		}
		else if (!this.accountAuthService.current && this.accountService.state !== States.login) {
			this.urlStateService.setUrl('account/login');
		}
	}

	/** Indicates whether the sidebar should take up the entire view. */
	public get showOnlySidebar () : boolean {
		return this.sidebarVisible && [
			States.contacts
		].filter(
			state => state === this.accountService.state
		).length > 0;
	}

	/** Indicates whether sidebar should be displayed. */
	public get sidebarVisible () : boolean {
		return this.accountAuthService.current !== undefined && [
			States.chat,
			States.contacts,
			States.home
		].filter(
			state => state === this.accountService.state
		).length > 0;
	}

	constructor (
		/** @ignore */
		private readonly accountAuthService: AccountAuthService,

		/** @ignore */
		private readonly urlStateService: UrlStateService,

		/** @see AccountService */
		public readonly accountService: AccountService,

		/** @see EnvService */
		public readonly envService: EnvService
	) {}
}
