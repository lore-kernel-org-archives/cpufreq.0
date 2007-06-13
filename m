From: "Mattia Dongili" <malattia@linux.it>
Subject: Re: Segmentation faults on AMD
Date: Wed, 13 Jun 2007 17:43:40 +0200 (CEST)
Message-ID: <29561.61.206.224.81.1181749420.squirrel@picard.linux.it>
References: <863ADB2B1B757B45A27E4FCCD2DD370648C483@ex2k.bankofamerica.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <863ADB2B1B757B45A27E4FCCD2DD370648C483@ex2k.bankofamerica.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: "Patel, Tushar" <tushar.patel@bofasecurities.com>
Cc: cpufreq@lists.linux.org.uk

On Wed, June 13, 2007 4:55 pm, Patel, Tushar wrote:
> Hi,
>
> I have followed all instructions to install this tool on :
> 1.) AMD Opteron(tm) Processor 252
> 2.) AMD Opteron (tm) Processor 885
>
> I keep getting segmentation faults.
>
> Can you please help?
>
> nbk3fdu@scspgmldap01:/var/tmp/tushar/cpufrequtils-002>cpufreq-info -c 0
> cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
> Report errors and bugs to linux@brodo.de, please.
> analyzing CPU 0:
> Segmentation fault

wow, can you build with debugging symbols and get a backtrace with GDB?
build the utilities with
  make DEBUG=true
and run
  gdb ./cpufreq-info
at the gdb prompt type
  (gdb) r
wait for the program to segfault and type
  (gdb) bt

paste the resulting output.

Thanks
-- 
mattia
:wq!
