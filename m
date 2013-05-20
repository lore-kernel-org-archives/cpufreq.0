From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 07/18] cpufreq: s3c24xx: move cpufreq driver to drivers/cpufreq
Date: Mon, 20 May 2013 22:47:59 +0900
Message-ID: <519A298F.2040605@samsung.com>
References: <cover.1365079581.git.viresh.kumar@linaro.org>	<CAKohponkFB7ND38jv5oGnQLx8cq0b=uHTCmL3EERe6P54ijYhw@mail.gmail.com>	<093901ce509f$afe92f40$0fbb8dc0$%kim@samsung.com>	<2001452.Fn2HjLbNED@vostro.rjw.lan> <CAKohpon97dbLDF0xU7vhf5V+UVeJv7WdeMuZ1jXLUTey2+gD2A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=KdOf+rTDFrUevtbgLzltr1blEtPa3uos/jZ+YKVYkrE=;
        b=zt1+2wtJuQTJuXUhzEWn9lKqQRkguTsPnpfh+9zEho4RhOgIyPOkFUJE/tZt+Sm40a
         Vg+fC0NsWNjZwDozN3BK9vDT413if8Pqe7usAmbpQKpZ7QuUcYWsb7C2dNorJKLx+C1o
         OIcNKhWIIWAuWFG4+AOAzkIlNz4DhUm5dWkDTSWFaMYBiH3N4IHjmFPBbZyyL3yzMqMN
         vVZzhAYMD/uVPEAoNT5k/bl8/QZKI9w0+AopTBoru7vK5fiuFN5LxhvZq/avh+JvKyDK
         a2q5Gy7RSX+MvnbIraZ101kgw5qug021GA1wuNgB3xDA5NQSv2WxztpTV09H2YTBtpun
         P4GQ==
In-Reply-To: <CAKohpon97dbLDF0xU7vhf5V+UVeJv7WdeMuZ1jXLUTey2+gD2A@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Robin Randhawa <robin.randhawa@arm.com>, Ben Dooks <ben-linux@fluff.org>, linux-pm@vger.kernel.org, patches@linaro.org, Liviu.Dudau@arm.com, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Steve.Bannister@arm.com, arvind.chauhan@arm.com, linaro-kernel@lists.linaro.org, charles.garcia-tobin@arm.com

On 05/20/13 14:29, Viresh Kumar wrote:

[...]

>>> Rafael, if you don't mind, let me take this into Samsung tree for v3.11.
>>
>> Sure, please go ahead.
>
> Kukjin,
>
> I hope you have already applied this for linux-next?

Yeah, already done in my local and you can see it in my public tree in a 
couple of hours :-)

Thanks.

- Kukjin
