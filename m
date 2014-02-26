From: Josh Triplett <josh@joshtriplett.org>
Subject: Re: [PATCH v2] drivers: cpufreq: Mark function as static in cpufreq.c
Date: Wed, 26 Feb 2014 09:08:47 -0800
Message-ID: <20140226170847.GA18427@thin>
References: <1393432706-25708-1-git-send-email-rashika.kheria@gmail.com>
 <20140226164142.GA18079@thin>
 <CAMpEsFFjR2e_kDn9-QuKcS3RjsSmru9XGjXqXXdO7sYeWdh9dw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMpEsFFjR2e_kDn9-QuKcS3RjsSmru9XGjXqXXdO7sYeWdh9dw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rashika Kheria <rashika.kheria@gmail.com>
Cc: Linux-Kernel <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org

On Wed, Feb 26, 2014 at 10:15:57PM +0530, Rashika Kheria wrote:
> On Wed, Feb 26, 2014 at 10:11 PM, Josh Triplett <josh@joshtriplett.org> wrote:
> > On Wed, Feb 26, 2014 at 10:08:26PM +0530, Rashika Kheria wrote:
> >> Mark function as static in cpufreq.c because it is not
> >> used outside this file.
> >>
> >> This eliminates the following warning in cpufreq.c:
> >> drivers/cpufreq/cpufreq.c:355:9: warning: no previous prototype for 'show_boost' [-Wmissing-prototypes]
> >>
> >> Signed-off-by: Rashika Kheria <rashika.kheria@gmail.com>
> >
> > I don't see any uses of this function in cpufreq.c; have uses appeared
> > in a development branch?
> >
> 
> It isn't used directly but through "define_one_global_rw(boost);".
> 
> The "define_one_global_rw()" is defined in include/linux/cpufreq.h. It
> therefore, need the definition of the function.

Ah, that's quite non-obvious.  Hiding the "show_" makes that hard to
grep for.

Reviewed-by: Josh Triplett <josh@joshtriplett.org>

> >>  drivers/cpufreq/cpufreq.c |    2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> >> index 08ca8c9..54fd670 100644
> >> --- a/drivers/cpufreq/cpufreq.c
> >> +++ b/drivers/cpufreq/cpufreq.c
> >> @@ -352,7 +352,7 @@ EXPORT_SYMBOL_GPL(cpufreq_notify_post_transition);
> >>  /*********************************************************************
> >>   *                          SYSFS INTERFACE                          *
> >>   *********************************************************************/
> >> -ssize_t show_boost(struct kobject *kobj,
> >> +static ssize_t show_boost(struct kobject *kobj,
> >>                                struct attribute *attr, char *buf)
> >>  {
> >>       return sprintf(buf, "%d\n", cpufreq_driver->boost_enabled);
> >> --
> >> 1.7.9.5
> >>
> 
> 
> 
> -- 
> Rashika Kheria
> B.Tech CSE
> IIIT Hyderabad
