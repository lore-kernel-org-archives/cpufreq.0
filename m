From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: ux500: send cpufreq notification for all cpus
Date: Wed, 24 Aug 2011 09:42:33 +0200
Message-ID: <CACRpkdaONJ+Vdx4JCPfWoqavQahiSgVGv5i=h3+J1kE2V=Q8SA@mail.gmail.com>
References: <1314168245-2373-1-git-send-email-vincent.guittot@linaro.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1314168245-2373-1-git-send-email-vincent.guittot@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-dev@lists.linaro.org, patches@linaro.org

On Wed, Aug 24, 2011 at 8:44 AM, Vincent Guittot
<vincent.guittot@linaro.org> wrote:

> The same clock is used for all cpus so we must notify the frequency change
> for each one in order to update the configuration of all twd clockevents.
>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
