From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 3/8] acpi-cpufreq: merge acpi functionality of cpufreq
	drivers
Date: Fri, 4 Aug 2006 13:03:38 -0400
Message-ID: <20060804170338.GK7265@redhat.com>
References: <44CE4F8A.5060600@linux.intel.com>
	<20060802092733.GI17014@poupinou.org>
	<44D0F292.8090403@linux.intel.com>
	<20060803161130.GL17014@poupinou.org>
	<20060803162024.GA22448@redhat.com>
	<20060804092212.GO17014@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060804092212.GO17014@poupinou.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@lists.linux.org.uk

On Fri, Aug 04, 2006 at 11:22:12AM +0200, Bruno Ducrot wrote:

 > > Newer VIA CPUs rely on this driver rather than longhaul for example.
 > 
 > Ah I see.  In fact we could add them already to
 > speedstep-centrino.c easily.

We could, though they need to rely on the ACPI tables rather than
hardcoded tables (as we've no way to distinguish regular from ULV
parts afaics), at which point it doesn't really buy us anything
over just using acpi-cpufreq which works without any modifications.

		Dave

-- 
http://www.codemonkey.org.uk
