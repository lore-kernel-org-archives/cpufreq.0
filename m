From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Changing CPU frequency in atomic (schedule / scheduler_tick)
Date: Tue, 18 Aug 2015 15:57:57 +0530
Message-ID: <CAOh2x=nYXetX5251oJ+RLEsMMtis=MazU+ZHzmfsY=XgvnJhXw@mail.gmail.com>
References: <CAMefCkCm10Rz3Ou_4gWhXhBzF44mS7K19WQrQF+aF+WC3-mceQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=rYet5JJZdEtnYA3qDFHvrvE3VPx0J+32zBD4e9I6uMA=;
        b=F3w6bPC6Qh/svuEfRK3jZApLCjFBNI6QxBb62nJWi8PRlj2MfxOa8Iuur2T12r8W6b
         XbXmEzm9/whkAr3fVowEwIiT+2o445ov2Gj+WjnM2GkWaKy0aDKyDRwx1vhSXXH2aVmJ
         Vaav+rw0/mGPmE8MC3KVSgN1ppLrwhXd3hbm0KMyZDk3PRuQFNjz63EEvJu0+BMMxIWH
         XBjX+3Thb8lOIV58fSCk4P6ZN/qhcBztb0bh+c2Hf+5GoM++ZGvSpeZJyVd8ibGaIdYJ
         YaKENyqH1VxU7mDFu1NObOsqf2wHx5zsrumEFiUqIZwT65hZnhSuNaUq/EGXUO4enCqu
         a10g==
In-Reply-To: <CAMefCkCm10Rz3Ou_4gWhXhBzF44mS7K19WQrQF+aF+WC3-mceQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guru Prasad <gurupras@buffalo.edu>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On Tue, Aug 18, 2015 at 9:16 AM, Guru Prasad <gurupras@buffalo.edu> wrote:
> We're working on a research system where we're trying to achieve
> optimal frequency selection on a per-process basis. To do so, I added
> additional fields to struct task_struct to store the (computed)
> optimal frequency and set it. The code that computes the optimal
> frequency is calculated on every scheduler_tick().
>
> I'm having trouble calling cpufreq_set_rate() from both a)
> scheduler_tick() and b) schedule().

Its not just about mutex-lock. The two scheduler functions mentioned above
are called from atomic context, but they can't call anything which can
potentially
sleep.

cpufreq_set_rate() or any clk_rate_set() can potentially sleep, and so must
not be called from there. Best do it from a workqueue.

--
viresh
