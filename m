From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH V3 2/2] cpufreq: AMD "frequency sensitivity feedback"
 powersave bias for ondemand governor
Date: Tue, 2 Apr 2013 22:40:14 +0200
Message-ID: <20130402204014.GH17675@pd.tnic>
References: <1364926304-1799-1-git-send-email-jacob.shin@amd.com>
 <1364926304-1799-3-git-send-email-jacob.shin@amd.com>
 <20130402192352.GC17675@pd.tnic>
 <20130402200337.GA17919@jshin-Toonie>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364935216; bh=8BpNY1YvcWC53v/7tElWGdUteS1zE8cAI1g/v4IJYuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=tx4bGqR2KTeCObVWJWp8RYalCx6CjxVZTaHBCx
	YmTIzSMuuf8HR/FHYOpVVbk2WpL29MFCXx0hsE/BgxPg7d0S6ZSMdADLOimFD52JNM6
	zw7qAVSwxQxWwglvvV8ijiITAEeTLsYQWIPkRdpuiFJ+hTfxwFnse1ZI63NDtLJ638=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364935216; bh=8BpNY1YvcWC53v/7tElWGdUteS1zE8cAI1g/v4IJYuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=tx4bGqR2KTeCObVWJWp8RYalCx6CjxVZTaHBCx
	YmTIzSMuuf8HR/FHYOpVVbk2WpL29MFCXx0hsE/BgxPg7d0S6ZSMdADLOimFD52JNM6
	zw7qAVSwxQxWwglvvV8ijiITAEeTLsYQWIPkRdpuiFJ+hTfxwFnse1ZI63NDtLJ638=
Content-Disposition: inline
In-Reply-To: <20130402200337.GA17919@jshin-Toonie>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacob Shin <jacob.shin@amd.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Thomas Renninger <trenn@suse.de>

On Tue, Apr 02, 2013 at 03:03:37PM -0500, Jacob Shin wrote:
> Well, so this powersave_bias also works as a tunable knob.
>
> From ondemand side, if /sys/../ondemand/powersave_bias is 0, then we
> (AMD sensitivity) don't get called and you get the default ondemand
> behavior.
>
> Like existing powersave_bias, users can tune the value to whatever
> they want, to get a specturum of less to more aggressive power savings
> vs performance.
>
> I thought tunable would be more flexible .. out in the field or what
> not .. no?

Ok, yes, that is the default on current systems which don't have hw
feedback.

But, on hw with such counters, I think the default should be to use
the hw feedback feature so that hardware can already do more informed
decisions for users.

As Thomas said, I hardly doubt users even know about that knob. So if we
can make the freq sensitivity thing work out of the box and without user
intervention, then we should strive to do that, no?

IOW:

	if (!powersave_bias) {
		/* user hasn't touched knob */

		if (HAS_FEEDBACK_INTERFACE)
			od_ops.powersave_bias_target(...);

		__cpufreq_driver_target(..)
	else
		od_ops.powersave_bias_target(..)
		__cpufreq_driver_target(..)
	}

The only change is that on hw feedback systems, you don't get the old
behavior with powersave_bias == 0. Question is, do you even want it all
that much but would rather leave the hw do much more informed decisions
than the ondemand governor.

Hmmm.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
