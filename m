From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: schedule_timeout sleeps too long after dividing CPU frequency
Date: Thu, 14 May 2015 15:42:39 +0100
Message-ID: <20150514144239.GZ2067@n2100.arm.linux.org.uk>
References: <55520F0F.5010906@free.fr>
 <CAKohpo=eMA6L9=jK=bAnbFuDxcdtpQNub0WFnSy6MOqB3jOdjA@mail.gmail.com>
 <555218C7.5050602@free.fr>
 <20150512155004.GP2067@n2100.arm.linux.org.uk>
 <555380F8.5050306@free.fr>
 <CAOh2x==aCLxCWX9K57hOFVEP1eLo_OYZPe0YvbFvpkXcoSp_hQ@mail.gmail.com>
 <5554858A.9010207@free.fr>
 <20150514115456.GB23999@linux>
 <55549DEE.6010202@free.fr>
 <CAKohpon4AV-7nq=Qm7PpDbbW9ti98avY9zz82htzyHWi5_K7fA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=pandora-2014;
	h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=IBQVqdRJgYCR+iw61hfrF+Xfz2/T+Rv96spqbjR0cMg=;
	b=qHIDKLpgWXUx0fgDTRVYubq/I3KVUQWOQ5N+4LJnWqt9uWHZLwHmfQxaa29ywpRVbf36paJx+Ba0XWKQt9G/hJQGAT/h0cw146c8i1J9qLA1ukgVoPOt/l74YjYMprOzeWx/1IBPnFkvJmGrhG120AZG/CUY6ifG4hOFKPqZksU=;
Content-Disposition: inline
In-Reply-To: <CAKohpon4AV-7nq=Qm7PpDbbW9ti98avY9zz82htzyHWi5_K7fA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Mason <slash.tmp@free.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mans Rullgard <mans@mansr.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux PM <linux-pm@vger.kernel.org>, cpufreq <cpufreq@vger.kernel.org>

On Thu, May 14, 2015 at 07:29:38PM +0530, Viresh Kumar wrote:
> On 14 May 2015 at 18:36, Mason <slash.tmp@free.fr> wrote:
> > When I execute "echo 18500 > scaling_max_freq"
> > the system is supposed to change the CPU frequency to 18.5 MHz
> > (I might have a bug lurking there) and PERIPHCLK is 1/2 of that,
> > i.e 9.25 MHz.
> 
> So at least we are on the right path. But it looks to me that this
> call is not getting propagated well.
> 
> >From the attachment you gave initially, the event handler for
> twd-timers is: tick_handle_periodic(). i.e. you are running in
> periodic mode and not onshot...
> 
> why ?

If it's in periodic mode, the update should still be propagated to the
hardware, assuming the generic time keeping code doesn't produce an
error.

twd_update_frequency
`-clockevents_update_freq
  `-__clockevents_update_freq
    `-__clockevents_set_state(, CLOCK_EVT_STATE_PERIODIC)
      `-dev->set_mode (twd_set_mode)

That re-writes the TWD_TIMER_LOAD register based on twd_timer_rate,
which would have been updated by twd_update_frequency().

The question I posed earlier remains: is clockevents_update_freq()
failing?  We don't know, because we never check its return value.

Another thing to look at is whether we reach twd_set_mode().

Lastly, printing the values of the TWD_TIMER_LOAD and TWD_TIMER_COUNTER
after twd_set_mode() has written TWD_TIMER_LOAD might provide some
hints as to what's going on.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
