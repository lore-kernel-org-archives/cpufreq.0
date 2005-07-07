From: Joseph Pingenot <trelane@digitasaru.net>
Subject: Re: enhanced intel speedstep feature was Re: speedstep-centrino on
	dothan
Date: Thu, 7 Jul 2005 15:51:17 -0500
Message-ID: <20050707205117.GB10635@digitasaru.net>
References: <20050706112202.33d63d4d@horst.morte.male>
	<42CC37FD.5040708@tmr.com> <20050706211159.GF27630@redhat.com>
	<20050706235557.0c122d33@horst.morte.male>
	<20050707220027.413343d4@horst.morte.male>
	<20050707200648.GA29142@redhat.com>
	<20050707222225.5b3113e0@horst.morte.male>
Reply-To: trelane@digitasaru.net
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050707222225.5b3113e0@horst.morte.male>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: st3@riseup.net
Cc: Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

>Just a latest question: can be p4-clockmod used together with
>speedstep-centrino? If not, would it make any sense to patch
>speedstep-centrino to use this feature too?

I'm a little confused.  How is this different from the ACPI CPU throttling
  states (/proc/acpi/processor/CPUn/limit to set, throttling to see all
  T-states available)?
On my 1.5-year-old Pentium-M, frequency scaling and T-states are different
  beasties, and act entirely differently.  I'm currently in the process of
  rewriting my governor's brain to deal with the two more intelligently.

-Joseph

-- 
Joseph===============================================trelane@digitasaru.net
      Graduate Student in Physics, Freelance Free Software Developer
