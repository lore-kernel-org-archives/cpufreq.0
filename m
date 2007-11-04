From: Andi Kleen <andi@firstfloor.org>
Subject: Re: Intel Clovertown vs. frequency scaling
Date: Mon, 05 Nov 2007 00:24:56 +0100
Message-ID: <p73y7dd1tmf.fsf@bingen.suse.de>
References: <20071012150126.GY6058@cern.ch>
	<653FFBB4508B9042B5D43DC9E18836F50181D939@scsmsx415.amr.corp.intel.com>
	<20071102163702.GE5966@cern.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20071102163702.GE5966@cern.ch> (Andras Horvath's message of
	"Fri\, 2 Nov 2007 17\:37\:02 +0100")
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
To: Andras.Horvath@cern.ch
Cc: cpufreq@lists.linux.org.uk

Andras.Horvath@cern.ch writes:
>
> According to the BIOS help there should be two more settings to that
> that give me C states but those are only described, they don't appear in
> the selection box. 

Desktop/Server boxes normally don't have any deeper C states than C1
and C1 is just the traditional "HLT" instruction and doesn't need
ACPI support at all and is usually not described in ACPI tables
when it's the only state.

The BIOS options likely just control what the BIOS' SMM handler does
hidden inside C1.

-Andi
