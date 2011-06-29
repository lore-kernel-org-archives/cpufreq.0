From: kevin diggs <diggskevin38@gmail.com>
Subject: Re: [PATCH 2/2] Add cpufreq driver for Momentum Maple boards
Date: Wed, 29 Jun 2011 13:09:30 -0500
Message-ID: <BANLkTikD_x3QA8_q8+444QhA39SEW6hVfg@mail.gmail.com>
References: <1308316207-9075-1-git-send-email-dbaryshkov@gmail.com>
	<1308316207-9075-2-git-send-email-dbaryshkov@gmail.com>
	<1309318110.32158.520.camel@pasglop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=xcmUANPzJKW0LtfPzKbi5V1+9RAcK50x0ycMsl9S9x4=;
        b=T3xS9DP/xGgMNAWhSP8bP5dwkBa+6z7ozAYUwu57YFm8NpdUazMHDFXOpaA+HYHk0l
         kr32cTqVOZ8LJwJBFbn3A6/7hAAbODmIs9mdApCYHbTiQIrzqBsaK4XuS06FncoP8Ovl
         iTaCZOb4OMzKXkHnN8WFVpMX16C9eIqiRdTfM=
In-Reply-To: <1309318110.32158.520.camel@pasglop>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Dave Jones <davej@redhat.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, cpufreq@vger.kernel.org

Hi,

On Tue, Jun 28, 2011 at 10:28 PM, Benjamin Herrenschmidt >
>
> If we're going to have a Kconfig.powerpc, should we maybe just have a
> powerpc subdirectory instead with the driver in it ?
>
Where would the powerpc subdirectory be? under drivers/cpufreq? Or
somewhere under arch/powerpc where it belongs (and I put my 750GX
stuff)?

>
>> + =A0 =A0 printk(KERN_INFO "Frequency method: SCOM, Voltage method: =
none\n");
>
> This is useless.
>
Why?

> Cheers,
> Ben.
>
kevin
