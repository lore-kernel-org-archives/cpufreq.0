From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH] cpufreq, ondemand: Remove leftover debug line
Date: Mon, 13 May 2013 14:14:04 +0200
Message-ID: <3026061.6K3iqZoMUx@vostro.rjw.lan>
References: <1368041688-29986-1-git-send-email-bp@alien8.de> <CAOh2x=kLJ3NVN177KTWjZikkZb8Q8RQjye4qrUT=PCdCj2jSgg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAOh2x=kLJ3NVN177KTWjZikkZb8Q8RQjye4qrUT=PCdCj2jSgg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Borislav Petkov <bp@alien8.de>, cpufreq@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@suse.de>

On Sunday, May 12, 2013 08:46:34 PM Viresh Kumar wrote:
> On Thu, May 9, 2013 at 1:04 AM, Borislav Petkov <bp@alien8.de> wrote:
> > From: Borislav Petkov <bp@suse.de>
> >
> > I don't see how the virtual address of the tuners pointer would be of
> > any help to anyone so remove it.
> >
> > Signed-off-by: Borislav Petkov <bp@suse.de>
> > ---
> >  drivers/cpufreq/cpufreq_ondemand.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
> > index b0ffef96bf77..4b9bb5def6f1 100644
> > --- a/drivers/cpufreq/cpufreq_ondemand.c
> > +++ b/drivers/cpufreq/cpufreq_ondemand.c
> > @@ -547,7 +547,6 @@ static int od_init(struct dbs_data *dbs_data)
> >         tuners->io_is_busy = should_io_be_busy();
> >
> >         dbs_data->tuners = tuners;
> > -       pr_info("%s: tuners %p\n", __func__, tuners);
> >         mutex_init(&dbs_data->mutex);
> >         return 0;
> >  }
> 
> Sorry for this message :(
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Applied to the linux-next branch.

Thanks,
Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
