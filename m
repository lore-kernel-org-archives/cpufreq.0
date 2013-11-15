From: viresh kumar <viresh.kumar@linaro.org>
Subject: Re: [RFC PATCH] cpufreq: cpufreq-cpu0: do not allow transitions with
 regulators suspended
Date: Fri, 15 Nov 2013 10:09:56 +0530
Message-ID: <5285A59C.2070603@linaro.org>
References: <1382638087-32054-1-git-send-email-nm@ti.com> <20131113151645.GA17828@kahuna> <52842671.40703@linaro.org> <2085822.gaTNcUz76n@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <2085822.gaTNcUz76n@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Nishanth Menon <nm@ti.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>

On Friday 15 November 2013 03:30 AM, Rafael J. Wysocki wrote:
> I'm not going to apply anything like this.  If I have already, that's been a mistake.
> 
> Do not mix assignments with logical operators in such outrageous ways, please.
> That's completely unreadable and confusing.

Okay... Will get it fixed for existing code as well..
