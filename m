From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH] cpufreq: cpufreq-cpu0: NULL is a valid regulator
Date: Tue, 13 Aug 2013 15:09:40 +0200
Message-ID: <1893015.38vNDktfpT@vostro.rjw.lan>
References: <1376071592-18930-1-git-send-email-broonie@kernel.org> <CAKohpoktDH_t0_eYigHMn8ZYm4ZT61yRymC00i1YGhWChE3ArQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpoktDH_t0_eYigHMn8ZYm4ZT61yRymC00i1YGhWChE3ArQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, cpufreq@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

On Monday, August 12, 2013 10:49:46 AM Viresh Kumar wrote:
> On 9 August 2013 23:36, Mark Brown <broonie@kernel.org> wrote:
> > From: Mark Brown <broonie@linaro.org>
> >
> > Since NULL could in theory be a valid regulator we ought to check for
> > IS_ERR() rather than for NULL. In practice this is unlikely to be an
> > issue but it's better for neatness.
> >
> > Signed-off-by: Mark Brown <broonie@linaro.org>
> > ---
> >  drivers/cpufreq/cpufreq-cpu0.c | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> Makes sense.
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Queued up for 3.12.

Thanks,
Rafael

