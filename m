From: Sebastian Witt <se.witt@gmx.net>
Subject: Re: Desktop with DVS
Date: Sun, 13 Jun 2004 19:40:48 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <40CC91A0.2030908@hasw.net>
References: <fd1d973998.biciolinux@aliceposta.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <fd1d973998.biciolinux@aliceposta.it>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

biciolinux@aliceposta.it wrote:

 >>>> This may be off the loop. But does anyone know if there are any 
desktop computers with dynamic voltage scaling capacity?
 >>
 >>
 >>> For x86{,_64}: AFAIK there are several choices: - some x86_64 AMD 
[server] processors and mainboards support voltage scaling,
 >
 >
 >
 >> That is not reserved to server.  Most modern UP desktops shipped 
with AMD64 do have what is called now 'cool'n quiet' technology, and 
should be supported
 >> by the powernow-k8 driver (you have to be sure that itt's enabled, 
though.
 >> Some northbridges do not allow this unfortunatelly, even though the 
processor
 >> is capable of that)
 >
 >
 >
 > Please, is possible to know which northbriges-motherboard are supported?
 >

Many nForce2-based boards are using a Attansic ATXP1 chip. With this 
chip it's possible to dynamically change the processor voltage (Epox 
8RDA serie: 1.075V - 2.2V).

Other boards:

Abit NF7
Aopen AK79D-400VN
Chaintech CT-7NJ(S,L1)
DFI Infinity NFII Ultra
DFI Lanparty NFII Ultra
Leadtek K7NCR-18D
Shuttle AN35N Ultra
Soltek 75FRN(2)-L

But the nForce2-chipset doesn't support AMD mobile CPUs, so it's maybe 
not the best for this.

Bye,
Sebastian
