From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Status of arch/arm in linux-next
Date: Wed, 20 Apr 2011 08:36:55 +0200
Message-ID: <BANLkTikYMFjjO+igBLN+FoXtWC_uroVUPQ@mail.gmail.com>
References: <20110414094447.GA1611@n2100.arm.linux.org.uk>
	<201104191655.13133.arnd@arndb.de>
	<BANLkTi=kGxL9N-RNqxmeqs4zeYo0zzfmhQ@mail.gmail.com>
	<201104191801.19348.arnd@arndb.de>
	<20110419162742.GB24372@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=aMlqk15yfljf4CwRTSEiYKb/U/qU1hCIRVvXwc55anc=;
        b=KlZAmdTTRfchbNeLIQYNnjBdrwSQpEyUKz6wz0Yzo3x4/HVq97RY49sn58jh6jRpgK
         okhsixhD7Ph+DD+JbyffkxwiUPmagdL9MRg8h1/IM5TCnI5+kJ7CktTAIN3kZJFlcInZ
         QtEVx7hlhRho+d6kq9Qx7Vjoe5xGG8IHKx6Dc=
In-Reply-To: <20110419162742.GB24372@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dave Jones <davej@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Tony Lindgren <tony@atomide.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-arm-kernel@lists.infradead.org

2011/4/19 Dave Jones <davej@redhat.com>:

> The platform drivers are by their nature architecture specific,
> so arch/ seems apropos. =A0drivers/platform/arm/ maybe ?

I opted for putting stuff in there, it was not popular, it will probabl=
y
just cause overpopulation there instead, like drivers/misc is doing
right now :-(

> Though, having arm do something different to every other arch seems
> a bit awkward too. Everyone else has their cpufreq platform driver
> somewhere under arch/whatever/../cpufreq/.. =A0so changing that
> violates the principle of least surprise.
>
> I'm also not convinced that moving them would increase review of chan=
ges.
>
> What problem is this solving again ?

Recent complaints from Linus (the other one) about overpopulation
bad code reuse and patch collision churn in the arch/arm/* tree.

If all cpufreq drivers (including the x86 ones!) were under
drivers/cpufreq/* it would mean better review and more
opportunity for consolidation I guess? We could begin the move
with a few ARM architectures. Do you agree?

Yours,
Linus Walleij
