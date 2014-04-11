From: Greg KH <greg@kroah.com>
Subject: Re: [stable request <=3.7] acpi-cpufreq: set current frequency based
 on target P-State
Date: Fri, 11 Apr 2014 09:05:43 -0700
Message-ID: <20140411160543.GC31676@kroah.com>
References: <20131220081912.GA13684@hobo.Home>
 <1395785057-28903-1-git-send-email-vlee@twopensource.com>
 <20140325221803.GA32518@hobo.lan>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=smtpout;
	 bh=or6w1DOaHwEeKUHNYR7WyQ4LKTE=; b=LZnx/cm7qgIJqDErwjrLu949ss0Q
	pcapRCWhubaOUZFxrRG+y+L1e1Vsq1KSIst227tEcj0p41/RfjHHz0FsMB/t3nAn
	nZTNyiJR42KxCwDaQVuPQIbebBNf0Pvw2hnZBks6Cjkb/uJ2hevqxlB2Jkw9YD2P
	+K1mdEf+Q0ZpKNk=
Content-Disposition: inline
In-Reply-To: <20140325221803.GA32518@hobo.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rosslagerwall@gmail.com
Cc: Vinson Lee <vlee@twopensource.com>, stable@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Len Brown <len.brown@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

On Tue, Mar 25, 2014 at 10:18:03PM +0000, rosslagerwall@gmail.com wrote:
> On Tue, Mar 25, 2014 at 03:04:16PM -0700, Vinson Lee wrote:
> > Hi.
> > 
> > Please backport upstream commit 8673b83bf2f013379453b4779047bf3c6ae387e4 
> > "acpi-cpufreq: set current frequency based on target P-State" to stable 
> > kernels 3.7 and earlier. This patch enables the kernel to control 
> > P-states on several platforms. Without this patch, the kernel was unable 
> > to control P-states on the same platforms.
> > 
> > The upstream patch cleanly applies to 3.7.
> > 
> > A backported patch is needed with the removal of SYSTEM_AMD_MSR_CAPABLE 
> > for kernels 3.6 and earlier.
> > 
> 
> I seem to recall that the problem was a regression introduced by commit
> 5a1c0228 (cpufreq: Avoid calling cpufreq driver's target() routine if
> target_freq == policy->cur) which was introduced in the 3.8 cycle.  Are
> you sure it is necessary for kernels < 3.8?

Given the lack of response here, I'm dropping these from my queue.  If
someone wants them back in, please resend after responding to this...

greg k-h
