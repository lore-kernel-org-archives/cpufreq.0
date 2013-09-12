From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 5/5] cpufreq: use correct values of cpus in __cpufreq_remove_dev_finish()
Date: Thu, 12 Sep 2013 12:56:58 +0200
Message-ID: <8571427.B6ubx1als5@vostro.rjw.lan>
References: <cover.1378963070.git.viresh.kumar@linaro.org> <5076102.HGJgP9ualc@vostro.rjw.lan> <CAKohpokiBoKxCMeD8a6YgMPZn1NXScvB0=5W3sB_OSZhJO2a1g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <CAKohpokiBoKxCMeD8a6YgMPZn1NXScvB0=5W3sB_OSZhJO2a1g@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>, Stephen Warren <swarren@wwwdotorg.org>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Patch Tracking <patches@linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thursday, September 12, 2013 04:13:03 PM Viresh Kumar wrote:
> On 12 September 2013 16:17, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> > Please resend.  And I honestly don't think that [1-3/5] are fixes and
> > [4/5] is not needed any more.
> 
> Okay, I will resend 5/5.. I didn't get you last two statements clearly :(
> - don't think that [1-3/5] are fixes: You meant they are cleanups rather?

Yes.

> Yes, and that's why I asked you to take those on for 3.13 and not for 12..

Ah, sorry, I must have overlooked that.  I didn't say I wasn't going to take
them, though.

> - [4/5] is not needed any more: 4/5 is already applied by you and it came
> from Rafael.. I reinvented the wheel, nothing more. And so it is not required
> anymore :)

Surely from Srivatsa?

Thanks,
Rafael

