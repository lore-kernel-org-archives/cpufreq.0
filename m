From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [RESEND PATCH 0/5] cpufreq: db8500: Rename driver and update some parts
Date: Wed, 12 Dec 2012 23:43:54 +0100
Message-ID: <22600894.oJDMcB8IQb@vostro.rjw.lan>
References: <1355153142-9534-1-git-send-email-ulf.hansson@stericsson.com> <CAPtuhTgcmdxtG9B6L5NMyLCrhQh2o0DFkq47e_YCMoBzVhaF=g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <CAPtuhTgcmdxtG9B6L5NMyLCrhQh2o0DFkq47e_YCMoBzVhaF=g@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Turquette <mturquette@linaro.org>
Cc: Ulf Hansson <ulf.hansson@stericsson.com>, cpufreq@vger.kernel.org, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rickard Andersson <rickard.andersson@stericsson.com>, Jonas Aberg <jonas.aberg@stericsson.com>, Vincent Guittot <vincent.guittot@linaro.org>, Philippe Begnic <philippe.begnic@st.com>, Ulf Hansson <ulf.hansson@linaro.org>

On Wednesday, December 12, 2012 12:56:48 PM Mike Turquette wrote:
> On Mon, Dec 10, 2012 at 7:25 AM, Ulf Hansson <ulf.hansson@stericsson.com> wrote:
> > From: Ulf Hansson <ulf.hansson@linaro.org>
> >
> > This patchset starts by renaming the db8500 cpufreq driver to a more generic
> > name. There are new variants which rely on it too, so instead we give it a
> > family name of dbx500.
> >
> > On top of that a fixup patch for initialization of the driver and some minor
> > cleanup patches are included as well.
> >
> > These patches can be material for 3.8.
> >
> > Since some patches for the db8500 cpufreq driver has recently been merged
> > through Mike Turquette's clk tree, I decided to base these patches on top
> > of the clk-next branch. So I hope Mike is fine by merging these patches
> > through his tree.
> >
> > So I will try to collect ACKs from Rafael for the cpufreq patches. The
> > mfd patch has already been ACKED by Samuel.
> >
> 
> Ulf,
> 
> Just FYI clk-next has been pulled by Linus for 3.8.  I can still take
> this branch once Rafael ACKs the CPUfreq bits if you want, but I think
> you have more options now that clk-next is merged in.  It's up to you.

Please regard them as acked.

Thanks,
Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
