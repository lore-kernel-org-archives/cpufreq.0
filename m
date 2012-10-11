From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 4/8] cpufreq: db8500: Fetch cpufreq table from platform
 data
Date: Thu, 11 Oct 2012 14:41:40 +0100
Message-ID: <20121011134140.GA15428@gmail.com>
References: <1349869349-8070-1-git-send-email-ulf.hansson@stericsson.com>
 <1349869349-8070-5-git-send-email-ulf.hansson@stericsson.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1349869349-8070-5-git-send-email-ulf.hansson@stericsson.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Ulf Hansson <ulf.hansson@stericsson.com>
Cc: linux-arm-kernel@lists.infradead.org, Mike Turquette <mturquette@ti.com>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Philippe Begnic <philippe.begnic@st.com>, Rickard Andersson <rickard.andersson@stericsson.com>, Jonas Aberg <jonas.aberg@stericsson.com>, Vincent Guittot <vincent.guittot@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>

> -static struct cpufreq_frequency_table freq_table[] =3D {
> -	[0] =3D {
> -		.index =3D 0,
> -		.frequency =3D 200000,
> -	},
> -	[1] =3D {
> -		.index =3D 1,
> -		.frequency =3D 400000,
> -	},
> -	[2] =3D {
> -		.index =3D 2,
> -		.frequency =3D 800000,
> -	},
> -	[3] =3D {
> -		/* Used for MAX_OPP, if available */
> -		.index =3D 3,
> -		.frequency =3D CPUFREQ_TABLE_END,
> -	},
> -	[4] =3D {
> -		.index =3D 4,
> -		.frequency =3D CPUFREQ_TABLE_END,
> -	},
> -};

So where has this table gone? Am I missing a patch?

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
