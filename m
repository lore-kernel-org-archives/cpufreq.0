From: "Moore, Robert" <robert.moore@intel.com>
Subject: RE: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPI
	P-statedriver
Date: Tue, 21 Oct 2003 10:12:14 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <CFF522B18982EA4481D3A3E23B83141C24B4BC@orsmsx407.jf.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
content-class: urn:content-classes:message
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>, cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org, linux-acpi <linux-acpi@intel.com>
Cc: "Mallick, Asit K" <asit.k.mallick@intel.com>, "Therien,
	Guy" <guy.therien@intel.com>, "Grover,
	Andrew" <andrew.grover@intel.com>, "Nakajima,
	Jun" <jun.nakajima@intel.com>, Dominik Brodowski <linux@brodo.de>


This is exactly what I was looking at doing, looks like most of the work
is done.  I have some concerns about the actual algorithm used for
changing the CPU frequency (20%/80%), but this of course can be tuned.

I suspect that CPUs that have the capability of changing frequency
themselves would not use this particular governor.

You may want to make the sampling rate configurable at run time.

Bob


-----Original Message-----
From: Pallipadi, Venkatesh=20
Sent: Monday, October 20, 2003 7:57 PM
To: cpufreq@www.linux.org.uk; linux-kernel@vger.kernel.org; linux-acpi
Cc: Mallick, Asit K; Nakajima, Jun; Dominik Brodowski
Subject: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPI
P-statedriver
