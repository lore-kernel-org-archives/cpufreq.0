From: mgillespie@mgillespie.plus.com
Subject: problems with longhaul cpufreq driver.
Date: 8 Dec 2003 16:26:00 -0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031208162600.mgillespie@Plus.Net>
Reply-To: mgillespie@mgillespie.plus.com
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk


Running Redhat9 with my own kernel compilation based on 2.4.23. 

I added the cpufreq patch built in (not module).  It patched cleanlt with no errors. 

When I look at my speeds, they are all 0. 

If I check the dmesg log, I see the following on startup: 

longhaul: VIA C3 'Ezra' [C5C] CPU detected. Longhaul v2 supported. 
longhaul: MinMult=5.0x MaxMult=6.0x 
longhaul: FSB: 0MHz Lowestspeed=0MHz Highestspeed=0MHz 
longhaul: FSB:0 Mult:10.0x 

My Setup:

Via EPIA c800, and using cpufreq: cpufreq-LINUX_2_4-20031207.tar.gz 

Here is a snippet of my config (options not used removed) 

# 
# Processor type and features 
# 
CONFIG_MCYRIXIII=y 
CONFIG_X86_WP_WORKS_OK=y 
CONFIG_X86_INVLPG=y 
CONFIG_X86_CMPXCHG=y 
CONFIG_X86_XADD=y 
CONFIG_X86_BSWAP=y 
CONFIG_X86_POPAD_OK=y 
CONFIG_RWSEM_XCHGADD_ALGORITHM=y 
CONFIG_X86_L1_CACHE_SHIFT=5 
CONFIG_X86_HAS_TSC=y 
CONFIG_X86_ALIGNMENT_16=y 
CONFIG_X86_USE_3DNOW=y 
CONFIG_X86_USE_PPRO_CHECKSUM=y 
CONFIG_X86_F00F_WORKS_OK=y 
CONFIG_X86_MCE=y 

# 
# CPU Frequency scaling 
# 
CONFIG_CPU_FREQ=y 
CONFIG_CPU_FREQ_TABLE=y 
CONFIG_CPU_FREQ_PROC_INTF=y 
CONFIG_CPU_FREQ_GOV_USERSPACE=y 
CONFIG_CPU_FREQ_24_API=y 
CONFIG_X86_LONGHAUL=y 
CONFIG_X86_CPUID=m 
CONFIG_NOHIGHMEM=y 
CONFIG_MTRR=y 
CONFIG_X86_TSC=y 

Anyone else got this problem? 
