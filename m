From: Maciej Rutecki <maciej.rutecki@gmail.com>
Subject: Re: [REGRESSION] 3.9.0-rcX
Date: Sun, 24 Mar 2013 16:36:25 +0100
Message-ID: <CAG9S4UjFJ2hLD7fXJ7D3Le=GC3xRZaD8vZ+YQOav5q+fnKO+Qw@mail.gmail.com>
References: <CAG9S4UjMeRZECAiigZVLTU4av2ZJNBukyUAoCmiYRjtkdThhFw@mail.gmail.com>
	<CAKohpokBySA5uaTTAwF5tmUr-_+W04Ki_f6cWTLu7n1C3Tcqog@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=PLXHhq6OJWie8Pe8Mrw7be3wO3l07LGwCAWy+DzxlLM=;
        b=IvI+0jA705mrQeoIptudAB9aIjITptsMn5h1dM7IrnussuAuQuEbGr4uYekbdpyTFU
         LdrpJ5e4QN7pFdPggV3quwtXzOgGr0rD/63uTwd8FwbLLE+oEsVkT7hKOmYBoBiEzPLZ
         Hej3Rj7P2BcwZ9rvZzEnkM2koicG7wWyTtVsaxelZXMUeRAgKX7hTwbjI37A/tlqGFFL
         Ea6CEU56V+5PylWR21ah4cD7kL8LfqTr3NaGvaEAIMcdHu7Z1gjgkFDM3qrrg8HSbIsg
         OJeqZvTws689T4HTWCev67lHTKYyn8Ufdwx5/DB0Dyw4kIuh4MaZDqZGxz0zNXRm6B9n
         WDGQ==
In-Reply-To: <CAKohpokBySA5uaTTAwF5tmUr-_+W04Ki_f6cWTLu7n1C3Tcqog@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

2013/3/24 Viresh Kumar <viresh.kumar@linaro.org>:
> On 24 March 2013 19:41, Maciej Rutecki <maciej.rutecki@gmail.com> wrote:
>> (long e-mail, sorry ;-))
>
> Don't be, it was useful :)
>
>> Last known good: 3.8.0
>>
>> Short description:
>> 1. On -rc3, after s2ram cpufreq does not set CPU on max frequency on high
>> load (on battery).
>
> Try attached patch for this.
>
-rc4 + yours path, config based on -rc3:

# CONFIG_X86_INTEL_PSTATE is not set
# CONFIG_X86_PCC_CPUFREQ is not set

(use acpi-cpufreq)

Freq. seems be ok. 'ondemand' governor works as expected.

Regards
