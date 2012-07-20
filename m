From: Richard Zhao <linuxzsc@gmail.com>
Subject: Re: [PATCH 3/3] cpufreq: Add a generic cpufreq-cpu0 driver
Date: Fri, 20 Jul 2012 20:51:17 +0800
Message-ID: <d9889f8c-cebd-482d-af5c-c9e207c3dfae@email.android.com>
References: <1342713281-31114-1-git-send-email-shawn.guo@linaro.org> <1342713281-31114-4-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=references:user-agent:in-reply-to:mime-version:content-type
         :content-transfer-encoding:subject:from:date:to:cc:message-id;
        bh=6V5sKjpSGWJJgBSEVPRXCq8QwxxtF4rfpkWRoiSdsuY=;
        b=f7bthJZvWeXn8HOwZ2c2oepF+NAlUHg+qvWJN8WGMd6kiTT0zbYOBPaAOAHgtXvx7v
         E7csYuxkRONihwOduJ6ghDyvRbviXt+ph+Kx9sSxIfExj63PErDUIIi1RfneBAiUaotB
         k3xZ24EPFMLJius2j5zOwGEbrHxXVuG4qomnRGEgKhXBin7bGahgnoY6PjDo5NyRxyOw
         BZ4e5+xIIBxHJa/SwPiyUnonNbWErvOX5Np3aq+M6PM/lHIikhmJIPTkRcKIEMIm9oGT
         Q8KKQARgQn/rlgvFWOAVTRkzZ9+feFwM+E7DnL6bGCwGQWlskep35872n2/bXl+bJcxy
         iyIA==
In-Reply-To: <1342713281-31114-4-git-send-email-shawn.guo@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Shawn Guo <shawn.guo@linaro.org>, "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Mike Turquette <mturquette@linaro.org>, linux-pm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, cpufreq@vger.kernel.org, Richard Zhao <richard.zhao@freescale.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org

Hi, Shawn,

I find you create a new driver rather than work on my generic cpufreq d=
river based on clk and regulator.
Is there any reason besides adding opp support?

Thanks
Richard
--=20
=E6=8A=B1=E6=AD=89=E6=9A=82=E6=97=B6=E6=97=A0=E6=B3=95=E8=AF=A6=E7=BB=86=
=E8=AF=B4=E6=98=8E=E3=80=82=E8=BF=99=E4=BB=BD=E9=82=AE=E4=BB=B6=E6=98=AF=
=E4=BD=BF=E7=94=A8=E5=AE=89=E8=A3=85=E6=9C=89K-9 Mail=E7=9A=84Android=E7=
=A7=BB=E5=8A=A8=E8=AE=BE=E5=A4=87=E5=8F=91=E9=80=81=E7=9A=84=E3=80=82
