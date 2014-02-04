From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: cpu0: make THERMAL_CPU support optional
Date: Tue, 4 Feb 2014 10:44:09 +0530
Message-ID: <CAKohpo=Q=J1je9jkaDj2nrG9vrbrJvc7kj4KzP=UFeEJbdhvng@mail.gmail.com>
References: <1391295009-10844-1-git-send-email-robherring2@gmail.com>
	<CAKohpomT2Nu2B7-jMA=776N4L9pknsYxvT5QdiHkKk3Ubwivjg@mail.gmail.com>
	<CAL_JsqLVABkE=FAefKthjn-oLitsDitJOktjqGwXM_Rqp3A5jQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLVABkE=FAefKthjn-oLitsDitJOktjqGwXM_Rqp3A5jQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robherring2@gmail.com>
Cc: Eduardo Valentin <eduardo.valentin@ti.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On 3 February 2014 21:44, Rob Herring <robherring2@gmail.com> wrote:
> That's certainly fine by me, but I don't know which platforms those are.

Probably OMAP as the author came from TI and has tested it on OMAPs

https://lkml.org/lkml/2013/9/26/787

> BTW, REGULATOR could probably be dropped as well. It certainly works
> w/o a regulator as highbank does not define one.

Sure. Get that out as well in the same patch.
