From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] e_powersaver: Underclock checks
Date: Wed, 13 Jul 2011 12:45:30 -0400
Message-ID: <20110713164529.GA1652@redhat.com>
References: <1310114243.2940.3.camel@phoenix>
 <4E1B745A.5000802@interia.pl>
 <4E1B8404.1050909@interia.pl>
 <20110711232517.GC20367@redhat.com>
 <4E1C7D96.1030500@interia.pl>
 <4E1DCA76.7090809@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4E1DCA76.7090809@interia.pl>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: =?utf-8?B?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Cc: Axel Lin <axel.lin@gmail.com>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On Wed, Jul 13, 2011 at 05:40:22PM +0100, Rafa=C5=82 Bilski wrote:
 >=20
 > >Some systems are using 1.2GHz@844mV processors running at 600MHz@79=
6mV.
 > OK. That's strange. It is 1,2GHz system. Can both ACPI p-states and =
"e_powersaver"
 > drivers be running at the same time?=20

no

 > Can BIOS change processor frequencies without
 > Linux knowing and without p-states driver loaded?

yes. Usually via SMI. some laptops do this when switching between power=
/battery,
and/or when overheating.

cpufreq usually detects when this happens and logs messages.

	Dave

