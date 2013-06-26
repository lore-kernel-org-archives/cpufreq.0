From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [PATCH v2 3/3] cpufreq:exynos:Extend Exynos cpufreq driver to
 support boost framework
Date: Wed, 26 Jun 2013 15:58:23 +0200
Message-ID: <20130626155823.47eb36fb@amdc308.digital.local>
References: <1370502472-7249-1-git-send-email-l.majewski@samsung.com>
 <1370941408-29304-1-git-send-email-l.majewski@samsung.com>
 <1370941408-29304-4-git-send-email-l.majewski@samsung.com>
 <CAKohponJ5FyuKywCGz5j8GYomwqEJ0B-CvJybp+_eLjrsRkXDA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-reply-to: <CAKohponJ5FyuKywCGz5j8GYomwqEJ0B-CvJybp+_eLjrsRkXDA@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocky" <rjw@sisk.pl>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, Jonghwa Lee <jonghwa3.lee@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>, linux-kernel <linux-kernel@vger.kernel.org>, Lukasz Majewski <l.majewski@majess.pl>, Andre Przywara <andre.przywara@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>

On Wed, 26 Jun 2013 16:35:32 +0530, Viresh Kumar wrote:
> On 11 June 2013 14:33, Lukasz Majewski <l.majewski@samsung.com> wrote:
> > The struct cpufreq_driver has been extended to embrace the
> > information related to boost support.
> >
> > When "boost_mode" device tree attribute is defined for a platform,
> > the low_level_boost pointer is filled with proper address. The
> > .low_level_boost field filled to NULL, indicates that boost is not
> > supported.
> 
> This patch is still few generations back :)

But this is v2 version of boost patches.

Please also review:
[PATCH v4 4/7]
[PATCH v4 5/7]
[PATCH v4 6/7]
[PATCH v4 7/7] - disable boost at thermal framework



-- 
Best regards,

Lukasz Majewski

Samsung R&D Institute Poland (SRPOL) | Linux Platform Group
