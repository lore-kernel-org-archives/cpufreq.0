From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V3 1/2] ARM: imx: add vddsoc/pu setpoint info into dts
Date: Thu, 19 Dec 2013 00:30:15 -0200
Message-ID: <CAOMZO5DzKbOovk=k0ryWsdUzwdx4y_3JSytNY7LiWhhq3AhtHw@mail.gmail.com>
References: <1387402010-31749-1-git-send-email-b20788@freescale.com>
	<CAOMZO5DCGOkUtWmEok-uEFsUpGLF+93Vhm9XFs02yH9Z+eV0uQ@mail.gmail.com>
	<ADD49D66-30FE-4D87-88D6-F8AE07376F3F@freescale.com>
	<112fab48e08c43749c0797328b1f1ee1@DM2PR03MB317.namprd03.prod.outlook.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=szbu81KcwxmKlmfXbhL1coyWMkp4TfHPPQftWG1/oVU=;
        b=m45oGxIz9pKrQQBtcsTM+anQuFPj8ZkPHb/vFyKfsO+ViWkp2epK4poBLXyUUTBWWj
         1B47t4jpb37x4nwBQ2DL7I4ogZNHMicdezSnFrMTAViT0qcMXS+PUWqbmJ5SvyrnVKoO
         unYh3WBUrncgUfQmznzkopbkwP5gM//QK46KuzsW5iFKaXj+M5cXbb1AZPTRFXG90k+L
         Fq6vj9SQ+Yhtte1DjIIjrtKJSHLf7HLP0Qk5L2r+wVce6OvlhKDTgWQTEsuCKXK/OOLq
         MviEgAOypk5wSHJUpcQc1yss13asUChk0LKd/blicaYwAt6/65ST6fEKRrhgguvaeE5R
         8oWA==
In-Reply-To: <112fab48e08c43749c0797328b1f1ee1@DM2PR03MB317.namprd03.prod.outlook.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Anson.Huang@freescale.com" <Anson.Huang@freescale.com>
Cc: Shawn Guo <shawn.guo@linaro.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>

On Thu, Dec 19, 2013 at 12:13 AM, Anson.Huang@freescale.com
<Anson.Huang@freescale.com> wrote:
> After re-consideration, I think below should be better:
> arm-supply: regulator node supplying arm.
> pu-supply: regulator node supplying pu.
> soc-supply: regulator node supplying soc.

Yes, this looks better.

Regards,

Fabio Estevam
