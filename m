From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 0/8] clk: ux500: Fixup smp_twd clk for clk notifiers
Date: Thu, 11 Oct 2012 16:19:47 +0100
Message-ID: <20121011151947.GD15428@gmail.com>
References: <1349869349-8070-1-git-send-email-ulf.hansson@stericsson.com>
 <20121011134458.GB15428@gmail.com>
 <CACRpkdYEukMzMX1Q8nb5zKPMZEZfttzWVC24aOkv2g8SCQtTnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYEukMzMX1Q8nb5zKPMZEZfttzWVC24aOkv2g8SCQtTnQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ulf Hansson <ulf.hansson@stericsson.com>, linux-arm-kernel@lists.infradead.org, Mike Turquette <mturquette@ti.com>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Philippe Begnic <philippe.begnic@st.com>, Rickard Andersson <rickard.andersson@stericsson.com>, Jonas Aberg <jonas.aberg@stericsson.com>, Vincent Guittot <vincent.guittot@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>

On Thu, 11 Oct 2012, Linus Walleij wrote:

> On Thu, Oct 11, 2012 at 3:44 PM, Lee Jones <lee.jones@linaro.org> wro=
te:
>=20
> >> Patches are based on Linus Torvalds tree with latest commit as of =
okt 10.
> >
> > Hmm... I get:
> >
> > Applying: clk: ux500: Support for prcmu_scalable_rate clock
> > error: drivers/clk/ux500/clk-prcmu.c: does not exist in index
> > error: drivers/clk/ux500/clk.h: does not exist in index
> > Patch failed at 0001 clk: ux500: Support for prcmu_scalable_rate cl=
ock
> >
> > So when did drivers/clk/ux500/* arrive?
>=20
> Exactly here, 10 days ago on Torvalds' master branch:

Ah I see. Basing patches on commits half way through the merge
window. Good move! ;)

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
