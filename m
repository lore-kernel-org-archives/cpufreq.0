From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: problem with acer extensa and cpufreq utils
Date: Tue, 20 Sep 2011 16:15:35 +0200
Message-ID: <20110920141535.GA14887@comet.dominikbrodowski.net>
References: <4E789CFC.30009@mail.t-com.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4E789CFC.30009@mail.t-com.sk>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Maximilian Wagner <stmax@mail.t-com.sk>
Cc: cpufreq@vger.kernel.org

What is the output of "cat /proc/cpuinfo" (run this command in the
terminal, please).

On Tue, Sep 20, 2011 at 04:02:36PM +0200, Maximilian Wagner wrote:
> hi, i have since january 2011AD a similary problem with one notebook
> of one friend.
> it is acer extensa 5235 and under ubuntu 10.10 don t want work the
> cpu freq utils.
>=20
> the program say me, the dynamic scaling of processor frequency are
> not supported.
> i have also flashed the bios, but this dosn=B4t help.
>=20
> its the same problem, also now in september 2011AD after loading of
> all actually updates of ubuntu.
>=20
> can you help me? pls if yes, tell me it very simple, i m only linux
> beginner.
>=20
> thank you very much.
>=20
> maximilian wagner
>=20
>=20
>=20
> Probl=E9m s podtaktov=E1n=EDm procesoru:
>=20
> # cpufreq-info
> cpufrequtils 006: cpufreq-info (C) Dominik Brodowski 2004-2009
> Report errors and bugs to cpufreq@vger.kernel.org, please.
> analyzing CPU 0:
>   no or unknown cpufreq driver is active on this CPU
>   maximum transition latency: 4294.55 ms.
> analyzing CPU 1:
>   no or unknown cpufreq driver is active on this CPU
>   maximum transition latency: 4294.55 ms.
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
