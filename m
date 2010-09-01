From: Tiago Marques <tiagomnm@gmail.com>
Subject: Speedstep on Celeron SU2300
Date: Wed, 1 Sep 2010 01:36:44 +0100
Message-ID: <AANLkTink-uNBXaE22PwRPq_TihmDexpBiOZ8OJthqfF7@mail.gmail.com>
References: <AANLkTiktJ5Xgnsmq2je7T3Yc5Sf53Bu8vWMM1XT1V_vm@mail.gmail.com>
 <AANLkTikhSK8ep1y7y8NJpJamGm0bhpqkWscYEx-era0h@mail.gmail.com>
 <AANLkTimq+M43QmZsW_FQX7=djANa=WRbqpk0hA6HVoFy@mail.gmail.com> <AANLkTinKUSMWC9GZpPeQGzFM_68sRRpU_=_vRunJ8jad@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:content-type;
        bh=1idfaBnL8MxlaTUrhNHa7AM/sS2SMDIA9vpEuO33IuE=;
        b=Mw/g+w8dYMuyJOw3QIfx+KVqLxawo6OVEbSr2ZL8I1w/V69yZWPF/GNz9/s5m0ZgWN
         ZBvUQYd2GZ9Athz/pEuEkW1/Z7FlE5GPp19P6hdQHeLRUdMHrVviwn5D/3IUkzcbjVkw
         ERecOo2lEcEvOMgBHFeQn1kgopMXirkkSPItk=
In-Reply-To: <AANLkTinKUSMWC9GZpPeQGzFM_68sRRpU_=_vRunJ8jad@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Hi,

Can someone give me some hints on this?
Best regards

On Sun, Aug 29, 2010 at 5:54 AM, Tiago Marques <tiagomnm@gmail.com> wrote:
>
> Hi,
> I'm having a problem with this processor not having frequency steps
> and apparently only voltage steps. I find it very strange but that's
> what Intel's documentation suggests. I can't load acpi-cpufreq because
> it doesn't find any device and battery life in linux is suffering
> around 20% less due to this. I have confirmed that the CPU supports
> Speedstep, just this very strange variation.
> Can I somehow help with this to get it fixed? Who are the current maintainers?
> Thanks,
> Tiago
