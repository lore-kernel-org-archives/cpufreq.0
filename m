From: Robos <robos@muon.de>
Subject: Help regarding epox 8hda3+ mobo
Date: Thu, 10 Jun 2004 03:19:26 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040610011925.GA1674@muon.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi List.
I'm new to this list but I hope I have prepared as best as I can. I have a
epox 8hda3+ motherboard with a 3000+ amd64. This is a desktop machine, but
nevertheless I would like to "cool'n quiet" it. Searching through the
archives I found nothing regarding this board but managed to pinpoint the
problem to 
dmesg: 
powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.00.09b)
acpi_processor-0973 [32] acpi_processor_get_per: Error evaluating _PSS
powernow-k8: BIOS error - no PSB

Oookay. From reading the list archives I saw that version 1.00.09b is rather
old-ish compared to what's in the list ("version 1.20.08b - March 20,
2004"). As I am not really a kernel hacker, what do I do? I think I have to
try|use the powernow-k8-acpi driver, but how do I make this? I use a
kernel.org vanilla kernel right now. 2.6.7-rc2 to be precise. I just looked
through the 2.6.7-rc3-mm1 patch, but in there is nothing regarding powernow.
Is there some patch repository somewhere? Tracking all those patches to 
patches is a little hard for me...
Thanks in advance!
Cheers
Robos


-- 
Robos - 
gpg --recv-keys --keyserver blackhole.pca.dfn.de 6EEADA09
It's GNU/Linux dammit! F U M $ !
