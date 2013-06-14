From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 1/3] cpufreq: ondemand: Change the calculation of
 target frequency
Date: Fri, 14 Jun 2013 14:44:01 +0200
Message-ID: <20130614124400.GA8693@pd.tnic>
References: <q46r5iepl3sunqe5eemv66hk.1370694869222@email.android.com>
 <1645236.hTWQPUhyIx@vostro.rjw.lan>
 <20130613223740.GE32112@pd.tnic>
 <1469773.K3KVgsTfzW@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1371213844; bh=EZ18HvrRDqHRC2kE/p7QF3FOUAgjIIAzWh52XA1+Eg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=SNkF7H/akxgBOtME3Ur7QPV0FXl46NSVNMiFss
	GQbDw54IKVM5jcIE3hlT5K2U2vwbaa0jNH1YugCbx5My96wwrTprmI/PFrfN9LpfLrt
	BXYTdK4Xx0o9akRzTELZOM2p2Z40fB5Jjn7PYIkQPcoYmRIiBA6rEZHqD6FZZ0hS7g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1371213844; bh=EZ18HvrRDqHRC2kE/p7QF3FOUAgjIIAzWh52XA1+Eg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=SNkF7H/akxgBOtME3Ur7QPV0FXl46NSVNMiFss
	GQbDw54IKVM5jcIE3hlT5K2U2vwbaa0jNH1YugCbx5My96wwrTprmI/PFrfN9LpfLrt
	BXYTdK4Xx0o9akRzTELZOM2p2Z40fB5Jjn7PYIkQPcoYmRIiBA6rEZHqD6FZZ0hS7g=
Content-Disposition: inline
In-Reply-To: <1469773.K3KVgsTfzW@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Stratos Karafotis <stratosk@semaphore.gr>, Borislav Petkov <bp@suse.de>, Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jun 14, 2013 at 02:46:38PM +0200, Rafael J. Wysocki wrote:
> OK, so here's a deal. After 3.10-rc1 goes out, I'll put this into
> linux-next

Yeah, you mean 3.11-rc1 here...

> for 3.12, so that people have a few more weeks to complain. If they
> don't, it'll go into 3.12.

but yep, sounds like a deal.

Thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
