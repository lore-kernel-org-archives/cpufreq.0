From: Thomas Renninger <trenn@suse.de>
Subject: Re: is /sys/devices/system/cpu/cpufreq/ondemand/ignore_nice_load gone ?
Date: Tue, 5 Jul 2011 09:38:56 +0200
Message-ID: <201107050938.56869.trenn@suse.de>
References: <201106251424.51860.toralf.foerster@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201106251424.51860.toralf.foerster@gmx.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: Toralf =?utf-8?q?F=C3=B6rster?= <toralf.foerster@gmx.de>
Cc: cpufreq@vger.kernel.org

On Saturday, June 25, 2011 02:24:51 PM Toralf F=C3=B6rster wrote:
> At my ThinkPad T400 I tried today kernel 3.0-rc4 but now I cannot use
> this command any longer :
> echo 1> /sys/devices/system/cpu/cpufreq/ondemand/ignore_nice_load
>=20
> Furthermore I miss the files under
> /sys/devices/system/cpu/cpu{0,1}/cpufreq
>=20
> Do I miss a (new ?) config option - I used the old kernel config and
> compared it carefully, but maybe ...

Sounds as if the cpufreq driver is not loaded at all?
=46or a T400 it should be the acpi_cpufreq driver.

   Thomas
