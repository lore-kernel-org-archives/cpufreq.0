From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] drivers: cpufreq: kirkwood: fix coccicheck warnings
Date: Fri, 22 Mar 2013 08:14:03 +0530
Message-ID: <CAOh2x=kh7C-5S0KYy7OQRhoZRzk6rgSPBYcVjd9RN5ck41Mx4w@mail.gmail.com>
References: <1363911022-7786-1-git-send-email-silviupopescu1990@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=MnvRGAQhOB9q6Gs1XtkrbLTC61QxJd0z/VMUqdzdVmc=;
        b=P0ukE7CTOR9cxvzI846e/CvdDvWLjYnJGZoOeV7m78CxwJ7spiRGnAPft8tbeRZ/T4
         qw34Syn2Gr5OKfW4eYoSFf+MSsflhPx2HwYJeSyKNgvAKoXi4mrMOR9xwkZw/B7KS4T4
         E/ut9F8wwElygEmQZZN4PSZec230yR9xPOniuTzIKHyl82mTSdgcPbsAcju3ZRi9a5Su
         GFnYMu2IrOEncr5yGUTtHiH85R8wtkBcpTEVM5eart2D4BVegn7pjKMBZgH5QOXlSP+h
         DRbHpUFSDYCr6y/lKamc0VCcJ5m/3GfQQK5zZTTWcDVNbLqs1ejzhXws9DISmr87lyZH
         WhOw==
In-Reply-To: <1363911022-7786-1-git-send-email-silviupopescu1990@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Silviu-Mihai Popescu <silviupopescu1990@gmail.com>
Cc: cpufreq@vger.kernel.org, rjw@sisk.pl, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Mar 22, 2013 at 5:40 AM, Silviu-Mihai Popescu
<silviupopescu1990@gmail.com> wrote:
> Convert all uses of devm_request_and_ioremap() to the newly introduced
> devm_ioremap_resource() which provides more consistent error handling.
>
> devm_ioremap_resource() provides its own error messages so all explicit
> error messages can be removed from the failure code paths.
>
> Signed-off-by: Silviu-Mihai Popescu <silviupopescu1990@gmail.com>
> ---
>  drivers/cpufreq/kirkwood-cpufreq.c |    8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
