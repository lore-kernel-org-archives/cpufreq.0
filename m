From: Matt Wright <matt@consultmatt.co.uk>
Subject: Re: Cpufreq and AMD mobile Athlon 4
Date: 03 Sep 2003 22:55:02 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1062626101.4840.0.camel@riogrande>
References: <1062500550.5141.3.camel@riogrande>
	<20030902125908.GB1225@redhat.com>
	<20030902220356.329829c1.simplex@freemail.hu>
	<20030902201722.GD1225@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-wxMLV+ZuvpMIXT8T+mF0"
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20030902201722.GD1225@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: cpufreq@www.linux.org.uk


--=-wxMLV+ZuvpMIXT8T+mF0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi guys,

See attached the decoded sys oops from my encounters with powernow-k7.

Regards,

Matt

On Tue, 2003-09-02 at 21:17, Dave Jones wrote:
> On Tue, Sep 02, 2003 at 10:03:56PM +0200, V?lgyi Zolt?n wrote:
> 
>  > I've got the same problem with my notebook. This is a 
>  > Fujitsu-Siemens Amilo A7600.
> 
> noted. Can you mail me the dmidecode output too please ?
> (See http://people.redhat.com/arjanv/dmidecode.c)
> 
>  > Nothing else.
>  > But what to do?
> 
> Is there a BIOS update available you can try ?
> 
> I really wish I had the time to get sysfs overrides written..
> 
> 		Dave

--=-wxMLV+ZuvpMIXT8T+mF0
Content-Disposition: attachment; filename=result
Content-Type: text/plain; name=result; charset=UTF-8
Content-Transfer-Encoding: 7bit

Unable to handle kernel NULL pointer dereference at virtual address 00000004
c019423c
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c019423c>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010246
eax: 00000000   ebx: c3c5df10   ecx: 00000000   edx: 00000000
esi: 00000000   edi: ffffffff   ebp: 00000000   esp: c3c5debc
ds: 0018   es: 0018   ss: 0018
Process bash (pid: 4857, stackpage=c3c5d000)
Stack: 00000000 c02a2ee0 c3c5df10 c3c5df40 c3c5df10 ccd007e8 c3c5df10 00000000
       c012860e c3c5df10 c2194898 0000000c c3c5df84 0000001b 00000000 c3c5df40
       c3c5df10 c0194838 c3c5df10 c3c5df10 0000001b 00000000 00000000 00000000
Call Trace:    [<ccd007e8>] [<c012860e>] [<c0194838>] [<c015dce0>] [<c013c1d3>]
  [<c0108dc7>]
Code: 8b 45 04 31 c9 83 f8 fe 74 1b 83 f8 ff 74 0c 3b 43 04 72 5a
 
>>EIP; c019423c <cpufreq_frequency_table_verify+5c/f0>   <=====
Trace; ccd007e8 <[powernow-k7]powernow_verify+18/20>
Trace; c012860e <cpufreq_set_policy+8e/270>
Trace; c0194838 <cpufreq_proc_write+f8/140>
Trace; c015dce0 <proc_file_write+40/50>
Trace; c013c1d3 <sys_write+a3/130>
Trace; c0108dc7 <system_call+33/38>
Code;  c019423c <cpufreq_frequency_table_verify+5c/f0>
00000000 <_EIP>:
Code;  c019423c <cpufreq_frequency_table_verify+5c/f0>   <=====
   0:   8b 45 04                  mov    0x4(%ebp),%eax   <=====
Code;  c019423f <cpufreq_frequency_table_verify+5f/f0>
   3:   31 c9                     xor    %ecx,%ecx
Code;  c0194241 <cpufreq_frequency_table_verify+61/f0>
   5:   83 f8 fe                  cmp    $0xfffffffe,%eax
Code;  c0194244 <cpufreq_frequency_table_verify+64/f0>
   8:   74 1b                     je     25 <_EIP+0x25>
Code;  c0194246 <cpufreq_frequency_table_verify+66/f0>
   a:   83 f8 ff                  cmp    $0xffffffff,%eax
Code;  c0194249 <cpufreq_frequency_table_verify+69/f0>
   d:   74 0c                     je     1b <_EIP+0x1b>
Code;  c019424b <cpufreq_frequency_table_verify+6b/f0>
   f:   3b 43 04                  cmp    0x4(%ebx),%eax
Code;  c019424e <cpufreq_frequency_table_verify+6e/f0>
  12:   72 5a                     jb     6e <_EIP+0x6e>

--=-wxMLV+ZuvpMIXT8T+mF0
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--=-wxMLV+ZuvpMIXT8T+mF0--


