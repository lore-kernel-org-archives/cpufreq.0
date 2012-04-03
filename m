From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] cpufreq: ondemand: handle SW coordinated CPUs
Date: Wed, 4 Apr 2012 01:26:36 +0200
Message-ID: <CAKnu2MoXp_UvkBAgkvBVYEMfyWC08kP_h=ZYXoVRBZUaOkT4sg@mail.gmail.com>
References: <1331311414-31996-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=bwnTtHG+w+wWuWYP3qVcqb1IIF8UqR/hAKibFT1N1sc=;
        b=wyzo/5Y4nVFN1BkLBflBY4OX7X5mM/ztw9iGKBS3ebjtqGMbyfjRsH2eV1Ga9/E3gP
         Aij5p0BrgcHD7BRb3DnOJl/GNxc9G9bFafG0hWYAjfNXJF+rkoCorK38J7Sxk5j7ako0
         Odt6XY6bDb2mdByRk5e161wlj8JUPU6dydbXwt9XCLojizzKgYc4cTe+vM9BOrrQ+tO2
         YCErauW+YJ7+IQmxO1kRf3CMww11BBEqGYZ/rKRypjGjMvk7tkm14mBMQjhfkDm3cxi2
         fppN/JANe8QCGKAIrUcOyN9Y8Cf/Ky4H9VINmXXpg/UApGbxkNBbHpJx/IGk1l6/GE0q
         d/RA==
In-Reply-To: <1331311414-31996-1-git-send-email-linus.walleij@stericsson.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org
Cc: Rickard Andersson <rickard.andersson@stericsson.com>, Linus Walleij <linus.walleij@linaro.org>

2012/3/9 Linus Walleij <linus.walleij@stericsson.com>:

> From: Rickard Andersson <rickard.andersson@stericsson.com>
>
> This patch fixes a bug that occured when we had load on
> a secondary CPU and the primary CPU was sleeping. Only
> one sampling timer was spawned and it was spawned as a
> deferred timer on the primary CPU, so when a secondary CPU
> had a change in load this was not detected by the ondemand
> governor.
>
> This patch make sure that deferred timers are run on all
> CPUs in the case of software controlled CPUs that run on
> the same frequency.
>
> Signed-off-by: Rickard Andersson <rickard.andersson@stericsson.com>
> Reviewed-by: Mian Yousaf Kaukab <mian.yousaf.kaukab@stericsson.com>
> Reviewed-by: Jonas Aberg <jonas.aberg@stericsson.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Ping on this. This is a very real problem to us so we'd like to
get some feedback on this...

Yours,
Linus Walleij
