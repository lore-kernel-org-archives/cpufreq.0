From: rosslagerwall@gmail.com
Subject: Re: [stable request <=3.7] acpi-cpufreq: set current frequency based
 on target P-State
Date: Wed, 26 Mar 2014 07:22:32 +0000
Message-ID: <20140326072232.GA777@hobo.lan>
References: <20131220081912.GA13684@hobo.Home>
 <1395785057-28903-1-git-send-email-vlee@twopensource.com>
 <20140325221803.GA32518@hobo.lan>
 <CAHTgTXVEjNUMkrTNSyu+TtXc+Ac5PsD8Sp4m-7Md6UNwQfwkJQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=Hte/3AEMBe8cVJiACb0RA0LGuhG/eYJmFGiRBWh6qb8=;
        b=clpVdKA9mEY+YyxT7IhicO4nq3Z4h01LaeWp7r+sl5NPX10r8mW8Oreu8cU1VKghTz
         0sD94v0MNEFVTD3s9+f3XWKyCUqykH7LTh2RxzMuLnewuDPMima47ETV9ItFw0NQdwiw
         K2st3JJQ6iL1rfCASGwgVOnczrjckxqGfs5IGAprtiDQaUpBIQUSlS8JPPqZmBQZFdl9
         8EBxAMYDmW5jnLuCOHbgHvfB+muthMxCfpiuheMSTc/xGPn/aNEiTmzGuwWsX7eH0dlV
         gjcBCp6ojn4mIbhAvWr/Lysm1aEdux0vkfvYhm5G0hCWsQJg7BBAL/weq7StFz3fH+fg
         eiAg==
Content-Disposition: inline
In-Reply-To: <CAHTgTXVEjNUMkrTNSyu+TtXc+Ac5PsD8Sp4m-7Md6UNwQfwkJQ@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinson Lee <vlee@twopensource.com>
Cc: stable@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Len Brown <len.brown@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Shatil Rafiullah <srafiullah@twopensource.com>

On Tue, Mar 25, 2014 at 03:53:40PM -0700, Vinson Lee wrote:
> On Tue, Mar 25, 2014 at 3:18 PM,  <rosslagerwall@gmail.com> wrote:
> > On Tue, Mar 25, 2014 at 03:04:16PM -0700, Vinson Lee wrote:
> >> Hi.
> >>
> >> Please backport upstream commit 8673b83bf2f013379453b4779047bf3c6ae387e4
> >> "acpi-cpufreq: set current frequency based on target P-State" to stable
> >> kernels 3.7 and earlier. This patch enables the kernel to control
> >> P-states on several platforms. Without this patch, the kernel was unable
> >> to control P-states on the same platforms.
> >>
> >> The upstream patch cleanly applies to 3.7.
> >>
> >> A backported patch is needed with the removal of SYSTEM_AMD_MSR_CAPABLE
> >> for kernels 3.6 and earlier.
> >>
> >
> > I seem to recall that the problem was a regression introduced by commit
> > 5a1c0228 (cpufreq: Avoid calling cpufreq driver's target() routine if
> > target_freq == policy->cur) which was introduced in the 3.8 cycle.  Are
> > you sure it is necessary for kernels < 3.8?
> >
> > Regards
> > --
> > Ross Lagerwall
> 
> 
> This specific patch allows P-states to work with the 3.4 kernel on
> several hardware platforms.
> 
> Perhaps this is not the correct patch to backport. However, P-states
> are not working properly with the 3.4 kernel, even though it does not
> have the regression commit 5a1c0228 "cpufreq: Avoid calling cpufreq
> driver's target() routine if target_freq == policy->cur" backported.
> 

Fair enough,

Cheers
-- 
Ross Lagerwall
