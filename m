From: "Grover, Andrew" <andrew.grover@intel.com>
Subject: RE: [PATCH] 1/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Wed, 22 Oct 2003 11:40:15 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <F760B14C9561B941B89469F59BA3A8470255EF66@orsmsx401.jf.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Ducrot Bruno <ducrot@poupinou.org>, "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@www.linux.org.uk, "Nakajima, Jun" <jun.nakajima@intel.com>, linux-acpi <linux-acpi@intel.com>, "Mallick,
	Asit K" <asit.k.mallick@intel.com>, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@brodo.de>

> From: Ducrot Bruno [mailto:ducrot@poupinou.org]=20

> Looking around some other asl, it seems also that if you verify that
> _PCT return FFixedHW, but length and address are both different to 0,
> it may be possible that a generic driver via MSR could work, but there
> is nothing in specs afaik (and specs can be changed if compatible..).

My understanding was that if the operation region is FFixedHW, the
parameters are meaningless (and should be 0). FFixedHW means the OS
knows without ACPI telling it how to switch states. That is, while R40
lists the MSRs for the addresses, that is useless and confusing, because
the OS should a priori know via a driver how to switch, and therefore
isn't looking at those parameters.

Regards -- Andy
