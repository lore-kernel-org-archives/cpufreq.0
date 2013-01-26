From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [Bug 48341] BUG: using smp_processor_id in preemptible powernow_k8
Date: Sat, 26 Jan 2013 14:34:21 +0100
Message-ID: <1494478.rB1bGKhYjb@vostro.rjw.lan>
References: <bug-48341-12968@https.bugzilla.kernel.org/> <20130126120054.50DF911FE9C@bugzilla.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20130126120054.50DF911FE9C@bugzilla.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: bugzilla-daemon@bugzilla.kernel.org
Cc: cpufreq@vger.kernel.org

On Saturday, January 26, 2013 12:00:54 PM bugzilla-daemon@bugzilla.kern=
el.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D48341

> --- Comment #3 from =C3=81lvaro Castillo <netsys@fedoraproject.org>  =
2013-01-26 12:00:53 ---
> Does not work on A6-4440M
> powernow-k8: this CPU is not supported anymore, using acpi-cpufreq in=
stead.
>=20
> 3.7.2-204.fc18.x86_64

Can you please test the current mainline (v3.8-rc5 as of today)?

A few patches have been applied to it affecting this area.


--=20
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
