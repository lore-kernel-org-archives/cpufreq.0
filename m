From: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [Query]: CPUFREQ: Affected and related cpus in cpufreq
Date: Wed, 10 Oct 2012 13:01:26 +0100
Message-ID: <50756396.9040705@arm.com>
References: <CAOh2x=mJUkRxwwTRh89-Xpm1WwB9ciDOXVohqoTu6B5k6meHdw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <CAOh2x=mJUkRxwwTRh89-Xpm1WwB9ciDOXVohqoTu6B5k6meHdw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: viresh kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, "cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>

Hi Viresh,

On 08/10/12 14:58, viresh kumar wrote:
> Hi All,
>
> Sorry for  asking one of the most basic question of cpufreq :(
>
> I couldn't get the difference between affected (policy->cpus) and
> related cpus (policy->related_cpus) in cpufreq...
>
> As per Documentation/code:
>
> affected_cpus(policy->cpus):
> - List of CPUs that require software coordination of frequency.
> - Processors part of affected_cpus share policy struct
> - Policy limits the frequencies that the processor can work with.
>
> related_cpus(policy->related_cpus):
> - List of CPUs that need some sort of frequency coordination, whether
>    software or hardware.
> - Processors part of related_cpus share governer.
Which document states this ?

As per my understanding and if you see in cpufreq.c, related_cpus are
used only when adding back the hotplugged cpu to get the governor.
Elsewhere affected_cpus is used.

Ideally it would be good if above statements is true.
E.g. In SMP with 4 CPUs(with same OPPs), if 0-1 and 2-3 need h/w 
co-ordination, then:
related_cpus: 0-1 and 2-3
affected_cpus: case#1: 0-1 and 2-3 if we want to have different policies
	       case#2: 0-3 if we want to have same policy on all CPUS
I believe this is not possible in current code.

> - Governer sets the rules, about when to change limits specified by policy.
>
> Correct?
>
> So, now comes the real question:
> - In which scenario's should we populate affected and related cpus?
> - Should related cpus will always be a superset of affected cpus?
>
> --
> Viresh
>
