From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 4/8] Documentation: devicetree: add cpu clock configuration
 data binding for Exynos4/5
Date: Sat, 17 May 2014 02:00:08 +0200
Message-ID: <5376A688.4010206@gmail.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com> <1400029876-5830-5-git-send-email-thomas.ab@samsung.com> <53769E1F.1090706@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=EdH7UpjPXU5VaSmi1ZQJ0DKi0pIccjapJ5iokeSXaOw=;
        b=XTyX4HPJRAa6AHp+7+zLU/1XrVd2ioNY6pdSmfxLrCYHDkmkPPVWnEnL5ndrEpiEMY
         Cgt0Rof8chxEX8UM5YRC2QQibgUQ1RXvXrKzK/cZRI3KLsp2t35JaZBDaO2lioVOp3iw
         TcX9WFh4njgrPs/gjZ66PluHvICohtRBHcM4yQ6tka0MEZn5rb5P4YCQz1VR88Isxv/u
         z5+dV8dhMRqT1YUcuR08QECGDvZO/pN2UyLpve3Si739dyj0kqQK/XzOLuXu4gKka8f2
         b/raj1ChHyuOyMx1/dghYqSBVHtYypzcwdC0Ff7RE1cZ5zNFu5ipLZbgXXYlWZLxUgcM
         u0jg==
In-Reply-To: <53769E1F.1090706@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Abraham <ta.omasab@gmail.com>, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, shawn.guo@linaro.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, l.majewski@samsung.com, viresh.kumar@linaro.org, heiko@sntech.de, thomas.ab@samsung.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>

On 17.05.2014 01:24, Tomasz Figa wrote:
> Also, shouldn't you also extend exynos5420-clock.txt in the same way?

Please ignore this comment. Somehow I thought other patches of this
series also had support for Exynos5420.

Best regards,
Tomasz
