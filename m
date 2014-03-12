From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: v3.13.5 intel_pstate: cpufreq: __cpufreq_add_dev: ->get() failed
Date: Wed, 12 Mar 2014 12:03:49 +0100
Message-ID: <3200960.7JIZ1krBuc@vostro.rjw.lan>
References: <CAA7pwKNmosWaWPR0x3kNzL7eNLk8vdCB=NknU9ayLT9s1fJQYA@mail.gmail.com> <1679162.yVRSrpzkOW@vostro.rjw.lan> <CAOh2x=mCs_C-g3fkeQic6g4hayaHyYMeAe7sXEFAhnL9gtyNEA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAOh2x=mCs_C-g3fkeQic6g4hayaHyYMeAe7sXEFAhnL9gtyNEA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, Patrik Lundquist <patrik.lundquist@gmail.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On Wednesday, March 12, 2014 01:25:17 PM Viresh Kumar wrote:
> On Wed, Mar 12, 2014 at 4:57 AM, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> >> Well, ->setpolicy drivers are a special case anyway, so we can simply skip the
> >> current frequency updates in __cpufreq_add_dev() and cpufreq_update_policy()
> >> for them.
> >
> > In other words, we can do something like in the patch below I suppose?
> 
> I don't think its a good idea to handle ->setpolicy specially here.
> Zero shouldn't
> be allowed as a return value of any online CPU. And doesn't matter at all with
> ->setpolicy or ->target.

I agree that returning 0 from ->get() is not a good idea, but that happened
already before your commit and you broke working code.

Also it doesn't make sense to update policy->cur before calling
cpufreq_set_policy() for ->setpolicy drivers, because they don't need that.
And that's what my patch is about.

-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
