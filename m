From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq/intel_pstate: Set timer timeout correctly
Date: Fri, 5 Apr 2013 10:49:14 +0530
Message-ID: <CAOh2x=mzQBSnBB3-10yGMdGfxMWeMcvE_t2Mvnz+fvdHv0-uaA@mail.gmail.com>
References: <1365096935-16730-1-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=kRtXLcsDlbjPSXgeVml7Ks4g5itNe9ql4zMU12mZwzE=;
        b=HpfL+L1zJD4TUSVZtJlXritfCFUFyUiJ9h0yAGMKNiTXP6ozOqxiFof7GOwki0P6aj
         RD2b4Sd7GglGKYRQoOJY2FGEHCcCgxGMqYHyjAVJnwHUjQgzXs9v6UVNoRaDrOn4lm3e
         H47jwNLdNAKAfaWO+jZuSvC+Eldcsxf9MuffE8NoEMa80bG8ILPPFXF9E+VRU8YtdtrX
         +wt7mI7BxIDnUJe/zkWp52BffzYxwRnmFn8UX2dR8KaeR9WU+sOXIu9wdCqOseoaDZ7V
         OR8lEaYr78JIRu8T3OQT/bqU6aiaX83x3WZubKCO4toL7iBUZuwcoOqAT2uEejl9G8MD
         gmLw==
In-Reply-To: <1365096935-16730-1-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com, Adam Williamson <awilliam@redhat.com>, Parag Warudkar <parag.lkml@gmail.com>
Cc: rjw@sisk.pl, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On Thu, Apr 4, 2013 at 11:05 PM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> The current calculation of the delay time is wrong and a cut and paste
> error from a previous experimental driver.  This can result in the
> timeout being set to jiffies + 1 which setup the driver to race with
> it's self if the apic timer interrupt happen at just the right time.
>
>
> https://bugzilla.redhat.com/show_bug.cgi?id=920289
>
> Reported-by: Adam Williamson <awilliam@redhat.com>
> Reported-by: Parag Warudkar <parag.lkml@gmail.com>
>
> Signed-off-by: Dirk Brandewie <dirk.brandewie@gmail.com>
> ---
>  drivers/cpufreq/intel_pstate.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)

Looks fine, but I would like to see a Tested-by from Adam/Parag
as they haven't said anything about this patch (even in bugzilla).
