From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] acpi-cpufreq: set current frequency based on target P-State
Date: Sat, 1 Jun 2013 15:18:12 +0530
Message-ID: <CAOh2x=kk9w7Gg1GTezu7Mz-L+VtuHnMoH9JheuCbkNiM7e-JgQ@mail.gmail.com>
References: <1370029517-10423-1-git-send-email-rosslagerwall@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=tQtRp5TDL1QZZ+pdVBDWgl7oX4FseNydOlyOsuoC5/A=;
        b=IOWJOffaBHo+tSUaELL2eKNhIqeOxZZQcuK+cEdhn+qkR/a1J59GQDZN/Uu8awq0vK
         yOU7T/RY7QmIT5Q2keg2gGyWl8VcrqlyUIAUiXzZlh2y+T3yipuUdbd9aKiLetcf/cMn
         SPelRDntdKzWUXX0LrND00fLx48PSnlY5wR5zWhI8U13BMzNMhZS8vEvwN2qx9uK1U8o
         MZKyEbY9keg6hQfumHlYG7gGg+JXFdP//2jZyAJX68Lxb5G387+Le/tGwSVPbZMUB/5K
         1SGQZblBaPZTKRXDOT2i8LRYfYox+bwYmeBSEn6EQaikdPiifqv2gjLTBXqqKmb5la+L
         b61Q==
In-Reply-To: <1370029517-10423-1-git-send-email-rosslagerwall@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ross Lagerwall <rosslagerwall@gmail.com>
Cc: cpufreq@vger.kernel.org, Andre Przywara <andre.przywara@amd.com>, Matthew Garrett <mjg@redhat.com>

On Sat, Jun 1, 2013 at 1:15 AM, Ross Lagerwall <rosslagerwall@gmail.com> wrote:
> 4b31e774 fixed bug #4634 and caused the driver to always set the
> target P-State at least once since the initial P-State may not be the
> desired one.  5a1c0228 caused a regression in this behavior.
>
> This fixes the regression by setting policy->cur based on the CPU's
> target frequency rather than the CPU's current reported frequency
> (which may be different).  This means the P-State will be set initially
> if the CPU's target frequency is different from the governor's target
> frequency.
>
> This fixes an issue where setting the default governor to performance
> wouldn't correctly enable turbo mode on all cores.
>
> Signed-off-by: Ross Lagerwall <rosslagerwall@gmail.com>
> ---
>  drivers/cpufreq/acpi-cpufreq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks for your patch.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
