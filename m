From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] ARM: ux500: send cpufreq notification for all cpus
Date: Mon, 29 Aug 2011 11:44:31 +0200
Message-ID: <CACRpkdakub21x+hco4+EBwLmiH9ZJsYQujsL=3m0H7g2LMFkEQ@mail.gmail.com>
References: <1314253880-2438-1-git-send-email-vincent.guittot@linaro.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1314253880-2438-1-git-send-email-vincent.guittot@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vincent Guittot <vincent.guittot@linaro.org>, Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-dev@lists.linaro.org, patches@linaro.org

On Thu, Aug 25, 2011 at 8:31 AM, Vincent Guittot
<vincent.guittot@linaro.org> wrote:

> The same clock is used for all cpus so we must notify the frequency change
> for each one in order to update the configuration of all twd clockevents.
>
> change since V1:
> * use policy->cpus instead of cpu_online_mask
>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Dave, are you picking this up?

Yours,
Linus Walleij
