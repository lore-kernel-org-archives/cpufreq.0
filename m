From: st3@riseup.net
Subject: Re: enhanced intel speedstep feature was Re: speedstep-centrino on
 dothan
Date: Thu, 7 Jul 2005 23:22:38 +0200
Message-ID: <20050707232238.077c7c1c@horst.morte.male>
References: <20050706112202.33d63d4d@horst.morte.male>
	<42CC37FD.5040708@tmr.com> <20050706211159.GF27630@redhat.com>
	<20050706235557.0c122d33@horst.morte.male>
	<20050707220027.413343d4@horst.morte.male>
	<20050707200648.GA29142@redhat.com>
	<20050707222225.5b3113e0@horst.morte.male>
	<20050707211033.GB24774@isilmar.linta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20050707211033.GB24774@isilmar.linta.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

On Thu, 7 Jul 2005 23:10:33 +0200
Dominik Brodowski <linux@dominikbrodowski.net> wrote:

> Do you use ACPI-based idling? If so, in which state is the CPU in (cat
> /proc/acpi/processor/*/power ? I suspect that you do not use ACPI (else 
> you wouldn't need the table-based approach) or that the ACPI-based idling is
> broken on your notebook; as then the Linux idle handler  only makes use of 
> "hlt" (IIRC), that is ACPI C1, while throttling "forces" ACPI C2 (again
>  IIRC).

For idling, I didn't mean 'real idling', but instead just 'doing nothing'
in ACPI C1 state, that's simply a CPU usage < 1%.

Sorry for being so lame =)


--
ciao
st3
