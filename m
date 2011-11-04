From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] db8500: fix build error due to undeclared i variable
Date: Fri, 4 Nov 2011 16:54:16 +0100
Message-ID: <CACRpkdb1BkMw=QPRfp+8HqQzKS6Z1+K=DhS47dofPTTEURR2=g@mail.gmail.com>
References: <1320408281.28679.1.camel@phoenix>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1320408281.28679.1.camel@phoenix>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org

On Fri, Nov 4, 2011 at 1:04 PM, Axel Lin <axel.lin@gmail.com> wrote:

> The variable i is removed by commit ded8433
> "[CPUFREQ] db8500: remove unneeded for loop iteration over freq_table",
> but current code to print available frequencies still uses the i variable.
> Thus add the i variable back to fix below buld error:

How could I miss this? :-(

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks,
Linus Walleij
