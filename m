From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq/intel_pstate: Add additional supported CPU ID
Date: Sat, 18 May 2013 17:15:37 +0530
Message-ID: <CAOh2x==jU5aFBQqGyARX7A0kNNEqpxCh4xOrqsv10MG4st7LyA@mail.gmail.com>
References: <1368801497-13072-1-git-send-email-dirk.j.brandewie@gmail.com>
	<1368807024-15251-1-git-send-email-dirk.j.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=5xHrLBk/YGhg3C2RVtd/EQYHfcDyyAyf+Fyc8nM62PU=;
        b=e4ngdjL84+qCwix8ILP5m0FRDXrOvMK57Gh7KotfpIAoEL3tg9xPWbKASatcZvJoyh
         Nyz3LkRBjIiAkl+OB5sRARg+JuBAcaVB0Ox6tD4b6tx/TKEjIjOqm1BV+Pa63arGWoFF
         +fGFnRqXZay+s4blA0qOd5gxVooy63s6/m/zJoFH4g8JzMRNVu57KUUYzxd0Jq6wKwP9
         Js9Jx1fgMDiYek5o/G9Txe3tfUIusjrBBZAS0XQypOYv5pUATbIMAWxbhK7G4EQhCZib
         UwD+r/wpYZaSPyNKwgaarC6KCCY94Zw/gSkAY/JRzlNe5nYX+g+r3oi/ficzcw8wvCBn
         6WVA==
In-Reply-To: <1368807024-15251-1-git-send-email-dirk.j.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: linux-pm@vger.kernel.org, rjw@sisk.pl, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>, torvalds@linux-foundation.org

On Fri, May 17, 2013 at 9:40 PM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.j.brandewie@intel.com>
>
> Add CPU ID for Ivybrigde processor.
>
> Cc: torvalds@linux-foundation.org
> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
> ---
>  drivers/cpufreq/intel_pstate.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Add my Acked-by: Viresh Kumar <viresh.kumar@linaro.org>, even if
next version is required with some more machine no.s
