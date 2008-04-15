From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: cpufreq-info fails for Intel Quad-Core X9650 (45nm Penryn)
Date: Mon, 14 Apr 2008 17:13:43 -0700
Message-ID: <924EFEDD5F540B4284297C4DC59F3DEEE17A55@orsmsx423.amr.corp.intel.com>
References: <a8472c960804141603o67daca87hedb8b7294d9fb962@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <a8472c960804141603o67daca87hedb8b7294d9fb962@mail.gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: Trevor Bowen <m27315@gmail.com>, cpufreq@lists.linux.org.uk

 

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk 
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Trevor Bowen
>Sent: Monday, April 14, 2008 4:03 PM
>To: cpufreq@lists.linux.org.uk
>Subject: cpufreq-info fails for Intel Quad-Core X9650 (45nm Penryn)
>
>Whenever I run cpufreq-info for the X9650, I get the following 
>output error:
>
>$ cpufreq-info
>cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
>Report errors and bugs to linux@brodo.de, please.
>analyzing CPU 0:
>  no or unknown cpufreq driver is active on this CPU
>analyzing CPU 1:
>  no or unknown cpufreq driver is active on this CPU
>analyzing CPU 2:
>  no or unknown cpufreq driver is active on this CPU
>analyzing CPU 3:
>  no or unknown cpufreq driver is active on this CPU
>
>I am using the 2.6.24-gentoo-r4 version of the kernel.  What am I doing
>wrong?
>

Most likely BIOS is not enabling frequency control on this CPU. Can you
check that you have the latest BIOS. Can you check whether there are any
frequency control related options in BIOS (Typically called Speedstep,
Enhanced Speedstep, EIST etc). If you don't see any such option, send in
output of acpidump to me (or better still, open a bug here
(http://bugzilla.kernel.org). You can find acpidump in pmtools package
here (http://www.lesswatts.org/projects/acpi/utilities.php)

Thanks,
Venki
