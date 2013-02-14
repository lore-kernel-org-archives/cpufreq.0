From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq/intel_pstate: Change to disallow module build
Date: Thu, 14 Feb 2013 21:40:43 +0530
Message-ID: <CAOh2x=mhtFsEJx57GTASAq+p4Ri-fvTmnkxZJzgifJ=3yTawXw@mail.gmail.com>
References: <20130212214949.GA1003@redhat.com>
	<1360786482-881-1-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=XvpbehkYEZJTo1loA/Q1ogYz3l1gNy5KDAA74nNsenI=;
        b=qwj9QGD5Jkc/iGwWtM2/8VrA19HD5MTjua8cz4aAJtfzKH749EO+AiUFJTTk1UB4oL
         KUqgG+MUVM98qa6QNyK9h6zG2eNqoDYyZXPLxx4mI8thpTkck+lwMgQXUAQEsNqA1PxQ
         vKYlcyQghuXlRxbAspNFU+zC/TcIlZXaxl2xNcfn27ozUktlxvOkzOH4HuCY+aY1h0sZ
         KAPCM1HrxIy/Rd6KMLS6pVNgh49NZwpoy6BUaQIs6ntiiQZgAkL5CrYBW+rB3HFFlOr9
         xvweeY28WDuMQ42Wocv94hUy53ErIEdLZmECkS/fnokdNAg9gXbD0JI5cpO32aR337Oo
         X/ww==
In-Reply-To: <1360786482-881-1-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: davej@redhat.com, rjw@sisk.pl, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On Thu, Feb 14, 2013 at 1:44 AM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> Load order is important in order for intel_pstate to take over as the
> default scaling driver from acpi-cpufreq.
>
> If both are built-in acpi-cpufreq uses late_initcall() and
> intel_pstate uses device_initcall() so it will be able to register as
> the scaling before acpi-cpufreq for the processors supported by
> intel_pstate.
>
> If acpi-cpufreq is built as a module then intel_pstate still gets
> first option to become the scaling driver.
>
> Signed-off-by: Dirk Brandewie <dirk.brandewie@gmail.com>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
