From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: I haven't been able to set the chosen policy for CPU0
Date: Mon, 19 May 2008 10:11:07 -0700
Message-ID: <924EFEDD5F540B4284297C4DC59F3DEE01119E0B@orsmsx423.amr.corp.intel.com>
References: <200805191842.22216.alcc@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-reply-to: <200805191842.22216.alcc@gmx.de>
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
To: alcc@gmx.de, cpufreq@lists.linux.org.uk

 

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk 
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of 
>Christian Flamm
>Sent: Monday, May 19, 2008 9:42 AM
>To: cpufreq@lists.linux.org.uk
>Subject: I haven't been able to set the chosen policy for CPU0
>
>I think I can now reproduce that misbehaviour. I happens when 
>both of my cores 
>are at 100%  - than min- *and* max-frequency fall down to 
>minimum (1000000Hz)
>

Looks like the CPUs are being driver to lower freq due to temperature
limits. CPUs being busy is increasing the temp and they go to lower freq
until they reach the lower temp. Looking at
/proc/acpi/thermal_zone/*/*
when this happens can confirm this.

Thanks,
Venki
