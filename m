From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: powernowk8 error on kernels later than 2.6.5 (long)
Date: Mon, 29 Nov 2004 23:04:31 +0100
Message-ID: <20041129220431.GA9167@dominikbrodowski.de>
References: <7608a89f04112912137882bc84@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <7608a89f04112912137882bc84@mail.gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thiago Guzella <thiago.guzella@gmail.com>
Cc: cpufreq@www.linux.org.uk

Hi,

On Mon, Nov 29, 2004 at 06:13:57PM -0200, Thiago Guzella wrote:
> powernow-k8:    0 : fid 0xe (2200 MHz), vid 0x2 (1500 mV)
> powernow-k8:    1 : fid 0xc (2000 MHz), vid 0x6 (1400 mV)
> powernow-k8:    2 : fid 0xa (1800 MHz), vid 0xa (1300 mV)
> powernow-k8:    3 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV)
> powernow-k8: cpu_init done, current fid 0xe, vid 0x0

AFAICS it might be the 
"- [powernow-k8] fix for Mobile Sempron 2800+, Acer Aspire 1362 [Paul Devriendt]"
issue again -- the initial frequency/voltage pair is not in the list of
supported states exported by the BIOS. The fix for that hasn't reached
Linus' or Dave's tree yet; so I wouldn't count on 2.6.10 but on 2.6.11...


Thanks,
	Dominik
