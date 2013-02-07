From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/3] cpufreq: exynos: Remove error return even if no soc found
Date: Thu, 7 Feb 2013 16:50:09 +0530
Message-ID: <CAOh2x=nAaVNZG-Dfe0v-Uy4zRxf+zmPhxGx+=1rC=cT787=Vbg@mail.gmail.com>
References: <1360179562-19950-1-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=HlrCUymxomyZKLyX1zfnGJnSadNOorTE3OMd7Suu1NQ=;
        b=eHnTYuf1NAOLZo55GkOYkhoFjXodRZXCfQEUZgRNgGRsXJFjmaAssn4WJpor0VSzvC
         O/Bxi65GKZtScVmWE2KUdJp6C+t8S5EflRMoKWA6i13ei6zLWco5p8Eg60iDXNm12WaY
         uqx9LoRcCus0MWMgcThavbvR2ZiT52hk1Mh0Ab6f552MZafWm0cH9NV+DUwMwZLs66fU
         odxL86O/SpR3pzFMAawJwdb4MLwqxd0FEeeV4b6M2fnNuTrm8Tg4wp82ehYtBb9iG/6v
         YE3gvzo2r6mlBqydtAIni2kf2kGI/Iu2nj7bUDXJBh0AOBH1/m0mouAMErqkZuFeYbYV
         FYBQ==
In-Reply-To: <1360179562-19950-1-git-send-email-amit.daniel@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amit Daniel Kachhap <amit.daniel@samsung.com>
Cc: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, Thomas Abraham <thomas.abraham@linaro.org>, cpufreq@vger.kernel.org

On Thu, Feb 7, 2013 at 1:09 AM, Amit Daniel Kachhap
<amit.daniel@samsung.com> wrote:
> This change is needed for adding different type of cpufreq driver
> and support single binary image.

That's not sufficient, we need more description of the problem you faced.
