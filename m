From: "Miroslav Vasic" <miroslav.vasic@gmail.com>
Subject: Re: Frequency changes for XScale PXA255
Date: Thu, 6 Jul 2006 19:09:01 +0200
Message-ID: <b6cb966c0607061009o64a6a47dnaa996219f6984c2e@mail.gmail.com>
References: <b6cb966c0607060232k40b87efrd51c9bbdbaf8a105@mail.gmail.com>
	<20060706160859.GA5441@isilmar.linta.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_78581_3231765.1152205741089"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060706160859.GA5441@isilmar.linta.de>
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
To: Miroslav Vasic <miroslav.vasic@gmail.com>, cpufreq@lists.linux.org.uk

------=_Part_78581_3231765.1152205741089
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi, Dominik.

In the attachment you will see the c code of my module. Following you can
see where I put some printks commands (functions: pxa_set_target and
cpufreq_notify_transition), which I use to follow where my module halts.
Every change comparing to the original function is bolded. After that is the
contents of the  console when I start the thread.

static int pxa_set_target(struct cpufreq_policy *policy,
                 unsigned int target_freq,
                 unsigned int relation)
{
    int idx;
    cpumask_t cpus_allowed;
    int cpu = policy->cpu;
    struct cpufreq_freqs freqs;
    pxa_freqs_t *pxa_freq_settings;
    struct cpufreq_frequency_table *pxa_freqs_table;
    unsigned long flags;
    unsigned int unused;
    unsigned int preset_mdrefr, postset_mdrefr;
    void *ramstart;

    /*my change*/
    printk(KERN_INFO "Entering in PXA_set_target \n");

    /*
     * Save this threads cpus_allowed mask.
     */
    cpus_allowed = current->cpus_allowed;

    /*
     * Bind to the specified CPU.  When this call returns,
     * we should be running on the right CPU.
     */
    set_cpus_allowed(current, cpumask_of_cpu(cpu));
    BUG_ON(cpu != smp_processor_id());

    /* Get the current policy */
    pxa_select_freq_table(policy, &pxa_freq_settings, &pxa_freqs_table);

    /* Lookup the next frequency */
    if (cpufreq_frequency_table_target(policy, pxa_freqs_table,
                                       target_freq, relation, &idx)) {
        return -EINVAL;
    }

    freqs.old = get_clk_frequency_khz(0);
    freqs.new = pxa_freq_settings[idx].khz;
    freqs.cpu = policy->cpu;
//    if(freq_debug) {
        printk(KERN_INFO "Changing CPU frequency to %d.%03d Mhz (SDRAM %d
Mhz).\n",
            freqs.new/1000, freqs.new%1000, (pxa_freq_settings[idx].div2) ?
            (pxa_freq_settings[idx].membus/2000) :
            (pxa_freq_settings[idx].membus/1000));
  //  }   //I wanted to see this information, so I deleted IF command

    ramstart = phys_to_virt(0xa0000000);

    /*
     * Tell everyone what we're about to do...
     * you should add a notify client with any platform specific
     * Vcc changing capability
     */
    printk(KERN_INFO "The first notify_transition \n");
    cpufreq_notify_transition1(&freqs, CPUFREQ_PRECHANGE);
    printk(KERN_INFO "The first notify_transition done \n");

    /* Calculate the next MDREFR.  If we're slowing down the SDRAM clock
     * we need to preset the smaller DRI before the change.  If we're
speeding
     * up we need to set the larger DRI value after the change.
     */
    preset_mdrefr = postset_mdrefr = MDREFR;
    if((MDREFR & MDREFR_DRI_MASK) >
MDREFR_DRI(pxa_freq_settings[idx].membus)) {
        preset_mdrefr = (preset_mdrefr & ~MDREFR_DRI_MASK) |
                        MDREFR_DRI(pxa_freq_settings[idx].membus);
    }
    postset_mdrefr = (postset_mdrefr & ~MDREFR_DRI_MASK) |
                    MDREFR_DRI(pxa_freq_settings[idx].membus);

    /* If we're dividing the memory clock by two for the SDRAM clock, this
     * must be set prior to the change.  Clearing the divide must be done
     * after the change.
     */
    if(pxa_freq_settings[idx].div2) {
        preset_mdrefr  |= MDREFR_DB2_MASK;
        postset_mdrefr |= MDREFR_DB2_MASK;
    } else {
        postset_mdrefr &= ~MDREFR_DB2_MASK;
    }

    printk(KERN_INFO "local_irq_save \n");
    local_irq_save(flags);
    printk(KERN_INFO "local_irq_saved \n");

    /* Set new the CCCR */
    CCCR = pxa_freq_settings[idx].cccr;

    __asm__ __volatile__("                                  \
        ldr r4, [%1] ;  /* load MDREFR */                   \
        b   2f ;                                            \
        .align  5 ;                                         \
1:                                                          \
        str %4, [%1] ;          /* preset the MDREFR */     \
        mcr p14, 0, %2, c6, c0, 0 ; /* set CCLKCFG[FCS] */  \
        str %5, [%1] ;          /* postset the MDREFR */    \
                                                            \
        b   3f       ;                                      \
2:      b   1b       ;                                      \
3:      nop          ;                                      \

"

        : "=&r"
(unused)
        : "r" (&MDREFR), "r" (CCLKCFG_TURBO|CCLKCFG_FCS), "r" (ramstart), \
          "r" (preset_mdrefr), "r" (postset_mdrefr)
        : "r4", "r5");
    printk(KERN_INFO "local_irq_restore \n");
    local_irq_restore(flags);
    printk(KERN_INFO "local_irq_restored \n");
    /*
     * Restore the CPUs allowed mask.
     */
    set_cpus_allowed(current, cpus_allowed);

    /*
     * Tell everyone what we've just done...
     * you should add a notify client with any platform specific
     * SDRAM refresh timer adjustments
     */
    printk(KERN_INFO "The second notify_transition \n");
    cpufreq_notify_transition1(&freqs, CPUFREQ_POSTCHANGE);
    printk(KERN_INFO "The second notify_transition done \n");

    return 0;
}



void cpufreq_notify_transition(struct cpufreq_freqs *freqs, unsigned int
state)
{
//    BUG_ON(irqs_disabled());    //I have tried without this command

    freqs->flags = cpufreq_driver->flags;
    dprintk("notification %u of frequency transition to %u kHz\n", state,
freqs->new);

    printk(KERN_INFO "NOTIFY TRANSITION \n");
    down_read(&cpufreq_notifier_rwsem);
    printk(KERN_INFO "NOTIFIER SEMAPHORE DOWN \n");
    switch (state) {
    case CPUFREQ_PRECHANGE:
        /* detect if the driver reported a value as "old frequency" which
         * is not equal to what the cpufreq core thinks is "old frequency".
         */
        printk(KERN_INFO "state is CPUFREQ_PRECHANGE \n");
        if (!(cpufreq_driver->flags & CPUFREQ_CONST_LOOPS)) {
            if ((likely(cpufreq_cpu_data[freqs->cpu])) &&
                (likely(cpufreq_cpu_data[freqs->cpu]->cpu == freqs->cpu)) &&
                (likely(cpufreq_cpu_data[freqs->cpu]->cur)) &&
                (unlikely(freqs->old != cpufreq_cpu_data[freqs->cpu]->cur)))
            {
                dprintk(KERN_WARNING "Warning: CPU frequency is %u, "
                       "cpufreq assumed %u kHz.\n", freqs->old,
cpufreq_cpu_data[freqs->cpu]->cur);
                freqs->old = cpufreq_cpu_data[freqs->cpu]->cur;
            }
        }
        notifier_call_chain(&cpufreq_transition_notifier_list,
CPUFREQ_PRECHANGE, freqs);
        adjust_jiffies(CPUFREQ_PRECHANGE, freqs);
        break;
    case CPUFREQ_POSTCHANGE:
        printk(KERN_INFO "state is CPUFREQ_POSTCHANGE \n");
        adjust_jiffies(CPUFREQ_POSTCHANGE, freqs);
        notifier_call_chain(&cpufreq_transition_notifier_list,
CPUFREQ_POSTCHANGE, freqs);
        if ((likely(cpufreq_cpu_data[freqs->cpu])) &&
            (likely(cpufreq_cpu_data[freqs->cpu]->cpu == freqs->cpu)))
            cpufreq_cpu_data[freqs->cpu]->cur = freqs->new;
        break;
    }
    up_read(&cpufreq_notifier_rwsem);
    printk(KERN_INFO "NOTIFIER SEMAPHORE UP \n");
}


bash-3.00# insmod ./modul.ko
Starting the module
POLICY
max frequency for the policy 398131
current frequency99532
value 0
flags 1610612755
Changing
Entering in PXA_set_target
Changing CPU frequency to 132.710 Mhz (SDRAM 66 Mhz).
The first notify_transition
NOTIFY TRANSITION
NOTIFIER SEMAPHORE DOWN
state is CPUFREQ_PRECHANGE
viper: setting CPU core voltage to 1.0V at 132.710MHz
NOTIFIER SEMAPHORE UP
The first notify_transition done
local_irq_save
local_irq_saved
local_irq_restore
local_irq_restored
The second notify_transition
NOTIFY TRANSITION
NOTIFIER SEMAPHORE DOWN
state is CPUFREQ_POSTCHANGE
NOTIFIER SEMAPHORE UP
The second notify_transition done
Done
current frequency132710
Starting the thread
Started
-bash-3.00# current frequency 132710
value 128
Changing
Entering in PXA_set_target
Changing CPU frequency to 99.532 Mhz (SDRAM 49 Mhz).
The first notify_transition
NOTIFY TRANSITION

Here everything stops.

If you need me anything to explain better, please tell me.

Thanks,

Miroslav Vasic

------=_Part_78581_3231765.1152205741089
Content-Type: text/x-csrc; name="modul.c"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="modul.c"
X-Attachment-Id: f_epbhtqiz

LyoKICogIGRyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxX215d2F5LmMKICogIAogKi8KCi8vI2luY2x1
ZGUgPGxpbnV4L2tlcm5lbF9zdGF0Lmg+CgoKI2luY2x1ZGUgPGxpbnV4L2NwdWZyZXEuaD4KI2lu
Y2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxwdGhyZWFkLmg+CiNpbmNsdWRlIDx1bmlzdGQuaD4K
I2luY2x1ZGUgPHJ0bF90aW1lLmg+CgoKCiNkZWZpbmUgREVGX0ZSRVFVRU5DWV9VUF9USFJFU0hP
TEQJCSg4MCkKI2RlZmluZSBNSU5fRlJFUVVFTkNZX1VQX1RIUkVTSE9MRAkJKDApCiNkZWZpbmUg
TUFYX0ZSRVFVRU5DWV9VUF9USFJFU0hPTEQJCSgxMDApCgojZGVmaW5lIERFRl9GUkVRVUVOQ1lf
RE9XTl9USFJFU0hPTEQJCSgyMCkKI2RlZmluZSBNSU5fRlJFUVVFTkNZX0RPV05fVEhSRVNIT0xE
CQkoMCkKI2RlZmluZSBNQVhfRlJFUVVFTkNZX0RPV05fVEhSRVNIT0xECQkoMTAwKQoKc3RhdGlj
IHVuc2lnbmVkIGludCAJCQkJZGVmX3NhbXBsaW5nX3JhdGU7CiNkZWZpbmUgTUlOX1NBTVBMSU5H
X1JBVEUJCQkoZGVmX3NhbXBsaW5nX3JhdGUgLyAyKQojZGVmaW5lIE1BWF9TQU1QTElOR19SQVRF
CQkJKDUwMCAqIGRlZl9zYW1wbGluZ19yYXRlKQojZGVmaW5lIERFRl9TQU1QTElOR19SQVRFX0xB
VEVOQ1lfTVVMVElQTElFUgkoMTAwMCkKI2RlZmluZSBERUZfU0FNUExJTkdfRE9XTl9GQUNUT1IJ
CSgxMCkKI2RlZmluZSBUUkFOU0lUSU9OX0xBVEVOQ1lfTElNSVQJCSgxMCAqIDEwMDApCiNkZWZp
bmUgc2FtcGxpbmdfcmF0ZV9pbl9IWih4KQkJCSgoKHggKiBIWikgPCAoMTAwMCAqIDEwMDApKT8x
OigoeCAqIEhaKSAvICgxMDAwICogMTAwMCkpKQoKdW5zaWduZWQgaW50IGNvdW50ZXI9MDsKdW5z
aWduZWQgbG9uZyBjb3VudGVyMT0wOwp1bnNpZ25lZCBsb25nIGNvdW50ZXIyPTA7CnN0cnVjdCB0
aW1ldmFsIG1pazsKc3RydWN0IHRpbWV2YWwgbWlrMTsKdW5zaWduZWQgbG9uZyBmbGFnc29yOwp1
bnNpZ25lZCBsb25nIGZsYWdzOwoKc3RhdGljIHZvaWQgZG9fZGJzX3RpbWVyKHZvaWQgKmRhdGEp
OwoKc3RydWN0IGNwdV9kYnNfaW5mb19zIHsKCXN0cnVjdCBjcHVmcmVxX3BvbGljeSAJKmN1cl9w
b2xpY3k7Cgl1bnNpZ25lZCBpbnQgCQlwcmV2X2NwdV9pZGxlX3VwOwoJdW5zaWduZWQgaW50IAkJ
cHJldl9jcHVfaWRsZV9kb3duOwoJdW5zaWduZWQgaW50IAkJZW5hYmxlOwp9OwoKc3RhdGljIERF
RklORV9QRVJfQ1BVKHN0cnVjdCBjcHVfZGJzX2luZm9fcywgY3B1X2Ric19pbmZvKTsKCnN0YXRp
YyB1bnNpZ25lZCBpbnQgZGJzX2VuYWJsZTsJLyogbnVtYmVyIG9mIENQVXMgdXNpbmcgdGhpcyBw
b2xpY3kgKi8KCnN0YXRpYyBERUNMQVJFX01VVEVYIAkoZGJzX3NlbSk7CnN0YXRpYyBERUNMQVJF
X1dPUksJKGRic193b3JrLCBkb19kYnNfdGltZXIsIE5VTEwpOwoKc3RydWN0IGRic190dW5lcnMg
ewoJdW5zaWduZWQgaW50IAkJc2FtcGxpbmdfcmF0ZTsKCXVuc2lnbmVkIGludAkJc2FtcGxpbmdf
ZG93bl9mYWN0b3I7Cgl1bnNpZ25lZCBpbnQJCXVwX3RocmVzaG9sZDsKCXVuc2lnbmVkIGludAkJ
ZG93bl90aHJlc2hvbGQ7Cn07CgpzdGF0aWMgc3RydWN0IGRic190dW5lcnMgZGJzX3R1bmVyc19p
bnMgPSB7CgkudXBfdGhyZXNob2xkIAkJPSBERUZfRlJFUVVFTkNZX1VQX1RIUkVTSE9MRCwKCS5k
b3duX3RocmVzaG9sZCAJPSBERUZfRlJFUVVFTkNZX0RPV05fVEhSRVNIT0xELAoJLnNhbXBsaW5n
X2Rvd25fZmFjdG9yIAk9IERFRl9TQU1QTElOR19ET1dOX0ZBQ1RPUiwKfTsKCi8qKioqKioqKioq
KioqKioqKioqKioqKioqKiBzeXNmcyBpbnRlcmZhY2UgKioqKioqKioqKioqKioqKioqKioqKioq
LwpzdGF0aWMgc3NpemVfdCBzaG93X3NhbXBsaW5nX3JhdGVfbWF4KHN0cnVjdCBjcHVmcmVxX3Bv
bGljeSAqcG9saWN5LCBjaGFyICpidWYpCnsKCXJldHVybiBzcHJpbnRmIChidWYsICIldVxuIiwg
TUFYX1NBTVBMSU5HX1JBVEUpOwp9CgpzdGF0aWMgc3NpemVfdCBzaG93X3NhbXBsaW5nX3JhdGVf
bWluKHN0cnVjdCBjcHVmcmVxX3BvbGljeSAqcG9saWN5LCBjaGFyICpidWYpCnsKCXJldHVybiBz
cHJpbnRmIChidWYsICIldVxuIiwgTUlOX1NBTVBMSU5HX1JBVEUpOwp9CgojZGVmaW5lIGRlZmlu
ZV9vbmVfcm8oX25hbWUpIAkJCQkJXApzdGF0aWMgc3RydWN0IGZyZXFfYXR0ciBfbmFtZSA9ICAJ
CQkJXApfX0FUVFIoX25hbWUsIDA0NDQsIHNob3dfIyNfbmFtZSwgTlVMTCkKCmRlZmluZV9vbmVf
cm8oc2FtcGxpbmdfcmF0ZV9tYXgpOwpkZWZpbmVfb25lX3JvKHNhbXBsaW5nX3JhdGVfbWluKTsK
Ci8qIGNwdWZyZXFfb25kZW1hbmQgR292ZXJub3IgVHVuYWJsZXMgKi8KI2RlZmluZSBzaG93X29u
ZShmaWxlX25hbWUsIG9iamVjdCkJCQkJCVwKc3RhdGljIHNzaXplX3Qgc2hvd18jI2ZpbGVfbmFt
ZQkJCQkJCVwKKHN0cnVjdCBjcHVmcmVxX3BvbGljeSAqdW51c2VkLCBjaGFyICpidWYpCQkJCVwK
ewkJCQkJCQkJCVwKCXJldHVybiBzcHJpbnRmKGJ1ZiwgIiV1XG4iLCBkYnNfdHVuZXJzX2lucy5v
YmplY3QpOwkJXAp9CnNob3dfb25lKHNhbXBsaW5nX3JhdGUsIHNhbXBsaW5nX3JhdGUpOwpzaG93
X29uZShzYW1wbGluZ19kb3duX2ZhY3Rvciwgc2FtcGxpbmdfZG93bl9mYWN0b3IpOwpzaG93X29u
ZSh1cF90aHJlc2hvbGQsIHVwX3RocmVzaG9sZCk7CnNob3dfb25lKGRvd25fdGhyZXNob2xkLCBk
b3duX3RocmVzaG9sZCk7CgpzdGF0aWMgc3NpemVfdCBzdG9yZV9zYW1wbGluZ19kb3duX2ZhY3Rv
cihzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnVudXNlZCwgCgkJY29uc3QgY2hhciAqYnVmLCBzaXpl
X3QgY291bnQpCnsKCXVuc2lnbmVkIGludCBpbnB1dDsKCWludCByZXQ7CglyZXQgPSBzc2NhbmYg
KGJ1ZiwgIiV1IiwgJmlucHV0KTsKCWlmIChyZXQgIT0gMSApCgkJcmV0dXJuIC1FSU5WQUw7CgoJ
ZG93bigmZGJzX3NlbSk7CglkYnNfdHVuZXJzX2lucy5zYW1wbGluZ19kb3duX2ZhY3RvciA9IGlu
cHV0OwoJdXAoJmRic19zZW0pOwoKCXJldHVybiBjb3VudDsKfQoKc3RhdGljIHNzaXplX3Qgc3Rv
cmVfc2FtcGxpbmdfcmF0ZShzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnVudXNlZCwgCgkJY29uc3Qg
Y2hhciAqYnVmLCBzaXplX3QgY291bnQpCnsKCXVuc2lnbmVkIGludCBpbnB1dDsKCWludCByZXQ7
CglyZXQgPSBzc2NhbmYgKGJ1ZiwgIiV1IiwgJmlucHV0KTsKCglkb3duKCZkYnNfc2VtKTsKCWlm
IChyZXQgIT0gMSB8fCBpbnB1dCA+IE1BWF9TQU1QTElOR19SQVRFIHx8IGlucHV0IDwgTUlOX1NB
TVBMSU5HX1JBVEUpIHsKCQl1cCgmZGJzX3NlbSk7CgkJcmV0dXJuIC1FSU5WQUw7Cgl9CgoJZGJz
X3R1bmVyc19pbnMuc2FtcGxpbmdfcmF0ZSA9IGlucHV0OwoJdXAoJmRic19zZW0pOwoKCXJldHVy
biBjb3VudDsKfQoKc3RhdGljIHNzaXplX3Qgc3RvcmVfdXBfdGhyZXNob2xkKHN0cnVjdCBjcHVm
cmVxX3BvbGljeSAqdW51c2VkLCAKCQljb25zdCBjaGFyICpidWYsIHNpemVfdCBjb3VudCkKewoJ
dW5zaWduZWQgaW50IGlucHV0OwoJaW50IHJldDsKCXJldCA9IHNzY2FuZiAoYnVmLCAiJXUiLCAm
aW5wdXQpOwoKCWRvd24oJmRic19zZW0pOwoJaWYgKHJldCAhPSAxIHx8IGlucHV0ID4gTUFYX0ZS
RVFVRU5DWV9VUF9USFJFU0hPTEQgfHwgCgkJCWlucHV0IDwgTUlOX0ZSRVFVRU5DWV9VUF9USFJF
U0hPTEQgfHwKCQkJaW5wdXQgPD0gZGJzX3R1bmVyc19pbnMuZG93bl90aHJlc2hvbGQpIHsKCQl1
cCgmZGJzX3NlbSk7CgkJcmV0dXJuIC1FSU5WQUw7Cgl9CgoJZGJzX3R1bmVyc19pbnMudXBfdGhy
ZXNob2xkID0gaW5wdXQ7Cgl1cCgmZGJzX3NlbSk7CgoJcmV0dXJuIGNvdW50Owp9CgpzdGF0aWMg
c3NpemVfdCBzdG9yZV9kb3duX3RocmVzaG9sZChzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnVudXNl
ZCwgCgkJY29uc3QgY2hhciAqYnVmLCBzaXplX3QgY291bnQpCnsKCXVuc2lnbmVkIGludCBpbnB1
dDsKCWludCByZXQ7CglyZXQgPSBzc2NhbmYgKGJ1ZiwgIiV1IiwgJmlucHV0KTsKCglkb3duKCZk
YnNfc2VtKTsKCWlmIChyZXQgIT0gMSB8fCBpbnB1dCA+IE1BWF9GUkVRVUVOQ1lfRE9XTl9USFJF
U0hPTEQgfHwgCgkJCWlucHV0IDwgTUlOX0ZSRVFVRU5DWV9ET1dOX1RIUkVTSE9MRCB8fAoJCQlp
bnB1dCA+PSBkYnNfdHVuZXJzX2lucy51cF90aHJlc2hvbGQpIHsKCQl1cCgmZGJzX3NlbSk7CgkJ
cmV0dXJuIC1FSU5WQUw7Cgl9CgoJZGJzX3R1bmVyc19pbnMuZG93bl90aHJlc2hvbGQgPSBpbnB1
dDsKCXVwKCZkYnNfc2VtKTsKCglyZXR1cm4gY291bnQ7Cn0KCiNkZWZpbmUgZGVmaW5lX29uZV9y
dyhfbmFtZSkgXApzdGF0aWMgc3RydWN0IGZyZXFfYXR0ciBfbmFtZSA9IFwKX19BVFRSKF9uYW1l
LCAwNjQ0LCBzaG93XyMjX25hbWUsIHN0b3JlXyMjX25hbWUpCgpkZWZpbmVfb25lX3J3KHNhbXBs
aW5nX3JhdGUpOwpkZWZpbmVfb25lX3J3KHNhbXBsaW5nX2Rvd25fZmFjdG9yKTsKZGVmaW5lX29u
ZV9ydyh1cF90aHJlc2hvbGQpOwpkZWZpbmVfb25lX3J3KGRvd25fdGhyZXNob2xkKTsKCnN0YXRp
YyBzdHJ1Y3QgYXR0cmlidXRlICogZGJzX2F0dHJpYnV0ZXNbXSA9IHsKCSZzYW1wbGluZ19yYXRl
X21heC5hdHRyLAoJJnNhbXBsaW5nX3JhdGVfbWluLmF0dHIsCgkmc2FtcGxpbmdfcmF0ZS5hdHRy
LAoJJnNhbXBsaW5nX2Rvd25fZmFjdG9yLmF0dHIsCgkmdXBfdGhyZXNob2xkLmF0dHIsCgkmZG93
bl90aHJlc2hvbGQuYXR0ciwKCU5VTEwKfTsKCnN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlX2dyb3Vw
IGRic19hdHRyX2dyb3VwID0gewoJLmF0dHJzID0gZGJzX2F0dHJpYnV0ZXMsCgkubmFtZSA9ICJt
eXdheSIsCn07CgovKioqKioqKioqKioqKioqKioqKioqKioqKiogc3lzZnMgZW5kICoqKioqKioq
KioqKioqKioqKioqKioqKi8KCi8qIG15IHdheSB0byBjaGFuZ2UgZnJlcXVlbmN5ICovCgpzdGF0
aWMgdm9pZCBteXdheV9mdW5jdGlvbihpbnQgY3B1KQp7CgoJc3RydWN0IGNwdV9kYnNfaW5mb19z
ICp0aGlzX2Ric19pbmZvOwoJc3RydWN0IGNwdWZyZXFfcG9saWN5ICpwb2xpY3k7CgoJdGhpc19k
YnNfaW5mbyA9ICZwZXJfY3B1KGNwdV9kYnNfaW5mbywgY3B1KTsKCWlmICghdGhpc19kYnNfaW5m
by0+ZW5hYmxlKQoJCXJldHVybjsKCglwb2xpY3kgPSB0aGlzX2Ric19pbmZvLT5jdXJfcG9saWN5
OwoKCWNvdW50ZXI9Y291bnRlcisxOwoJc3dpdGNoIChjb3VudGVyKQoJCXsKCQkJCSBjYXNlIDE6
CgkJCQkJCV9fY3B1ZnJlcV9kcml2ZXJfdGFyZ2V0KHBvbGljeSwgcG9saWN5LT5taW4sIENQVUZS
RVFfUkVMQVRJT05fSCk7CgkJCQkJCXByaW50ayhLRVJOX0FMRVJUICJGcmVxdWVuY3k6IDk5IE1I
eiAiKTsKCQkJCQkJYnJlYWs7CgkJCQkgY2FzZSAyOgoJCQkJCQlfX2NwdWZyZXFfZHJpdmVyX3Rh
cmdldChwb2xpY3ksIDE1MDAwMCwgQ1BVRlJFUV9SRUxBVElPTl9IKTsKCQkJCQkJcHJpbnRrKEtF
Uk5fQUxFUlQgIkZyZXF1ZW5jeTogMTUwICIpOwoJCQkJCQlicmVhazsKCQkJCSBjYXNlIDM6CgkJ
CQkJCV9fY3B1ZnJlcV9kcml2ZXJfdGFyZ2V0KHBvbGljeSwgMjAwMDAwLCBDUFVGUkVRX1JFTEFU
SU9OX0gpOwoJCQkJCQlwcmludGsoS0VSTl9BTEVSVCAiRnJlcXVlbmN5OiAyMDAiKTsKCQkJCQkJ
YnJlYWs7CgkJCQkgY2FzZSA0OgoJCQkJCQlfX2NwdWZyZXFfZHJpdmVyX3RhcmdldChwb2xpY3ks
IDMwMDAwMCwgQ1BVRlJFUV9SRUxBVElPTl9IKTsKCQkJCQkJcHJpbnRrKEtFUk5fQUxFUlQgIkZy
ZXF1ZW5jeTogMzAwICAiKTsKCQkJCQkJYnJlYWs7CgkJCQkgY2FzZSA1OgoJCQkJCQlfX2NwdWZy
ZXFfZHJpdmVyX3RhcmdldChwb2xpY3ksIHBvbGljeS0+bWF4LCBDUFVGUkVRX1JFTEFUSU9OX0gp
OwoJCQkJCQlwcmludGsoS0VSTl9BTEVSVCAiRnJlcXVlbmN5OiA0MDAgICIpOwoJCQkJCQlicmVh
azsKCQkJCSBkZWZhdWx0OgoJCQkJCQljb3VudGVyPTA7CgkJCQkJCWJyZWFrOwoJCQkJfQp9CgoK
c3RhdGljIHZvaWQgZG9fZGJzX3RpbWVyKHZvaWQgKmRhdGEpCnsgCglpbnQgaTsKCWRvd24oJmRi
c19zZW0pOwoJZm9yIChpID0gMDsgaSA8IE5SX0NQVVM7IGkrKykKCQlpZiAoY3B1X29ubGluZShp
KSkKCQkJbXl3YXlfZnVuY3Rpb24oaSk7ICAvL2NhbGwgdG8gY2hhbmdlIGZyZXF1ZW5jeQoJc2No
ZWR1bGVfZGVsYXllZF93b3JrKCZkYnNfd29yaywgc2FtcGxpbmdfcmF0ZV9pbl9IWig1MDAwMDAw
KSk7Cgl1cCgmZGJzX3NlbSk7Cn0gCgpzdGF0aWMgaW5saW5lIHZvaWQgZGJzX3RpbWVyX2luaXQo
dm9pZCkKewoJSU5JVF9XT1JLKCZkYnNfd29yaywgZG9fZGJzX3RpbWVyLCBOVUxMKTsKCXNjaGVk
dWxlX2RlbGF5ZWRfd29yaygmZGJzX3dvcmssc2FtcGxpbmdfcmF0ZV9pbl9IWig1MDAwMDAwKSk7
CglyZXR1cm47Cn0KCnN0YXRpYyBpbmxpbmUgdm9pZCBkYnNfdGltZXJfZXhpdCh2b2lkKQp7Cglj
YW5jZWxfZGVsYXllZF93b3JrKCZkYnNfd29yayk7CglyZXR1cm47Cn0KCnN0YXRpYyBpbnQgY3B1
ZnJlcV9nb3Zlcm5vcl9kYnMoc3RydWN0IGNwdWZyZXFfcG9saWN5ICpwb2xpY3ksCgkJCQkgICB1
bnNpZ25lZCBpbnQgZXZlbnQpCnsKCXVuc2lnbmVkIGludCBjcHUgPSBwb2xpY3ktPmNwdTsKCXN0
cnVjdCBjcHVfZGJzX2luZm9fcyAqdGhpc19kYnNfaW5mbzsKCQoKCXRoaXNfZGJzX2luZm8gPSAm
cGVyX2NwdShjcHVfZGJzX2luZm8sIGNwdSk7CglwcmludGsoIlNUQVJUIEd1dmVybmVyYSBcbiIp
OwoJc3dpdGNoIChldmVudCkgewoJY2FzZSBDUFVGUkVRX0dPVl9TVEFSVDoKCQkKCQlicmVhazsK
CgljYXNlIENQVUZSRVFfR09WX1NUT1A6CgkJZG93bigmZGJzX3NlbSk7CgkJdGhpc19kYnNfaW5m
by0+ZW5hYmxlID0gMDsKCQlzeXNmc19yZW1vdmVfZ3JvdXAoJnBvbGljeS0+a29iaiwgJmRic19h
dHRyX2dyb3VwKTsKCQlkYnNfZW5hYmxlLS07CgkJLyoKCQkgKiBTdG9wIHRoZSB0aW1lcnNjaGVk
dWxlIHdvcmssIHdoZW4gdGhpcyBnb3Zlcm5vcgoJCSAqIGlzIHVzZWQgZm9yIGZpcnN0IHRpbWUK
CQkgKi8KCQlpZiAoZGJzX2VuYWJsZSA9PSAwKSAKCQkJZGJzX3RpbWVyX2V4aXQoKTsKCQkKCQl1
cCgmZGJzX3NlbSk7CgoJCWJyZWFrOwoKCWNhc2UgQ1BVRlJFUV9HT1ZfTElNSVRTOgoJCWRvd24o
JmRic19zZW0pOwoJCWlmIChwb2xpY3ktPm1heCA8IHRoaXNfZGJzX2luZm8tPmN1cl9wb2xpY3kt
PmN1cikKCQkJX19jcHVmcmVxX2RyaXZlcl90YXJnZXQoCgkJCQkJdGhpc19kYnNfaW5mby0+Y3Vy
X3BvbGljeSwKCQkJCSAgICAgICAJcG9saWN5LT5tYXgsIENQVUZSRVFfUkVMQVRJT05fSCk7CgkJ
ZWxzZSBpZiAocG9saWN5LT5taW4gPiB0aGlzX2Ric19pbmZvLT5jdXJfcG9saWN5LT5jdXIpCgkJ
CV9fY3B1ZnJlcV9kcml2ZXJfdGFyZ2V0KAoJCQkJCXRoaXNfZGJzX2luZm8tPmN1cl9wb2xpY3ks
CgkJCQkgICAgICAgCXBvbGljeS0+bWluLCBDUFVGUkVRX1JFTEFUSU9OX0wpOwoJCXVwKCZkYnNf
c2VtKTsKCQlicmVhazsKCX0KCXJldHVybiAwOwp9CgpzdHJ1Y3QgY3B1ZnJlcV9nb3Zlcm5vciBj
cHVmcmVxX2dvdl9kYnMgPSB7CgkubmFtZQkJPSAibXl3YXkiLAoJLmdvdmVybm9yCT0gY3B1ZnJl
cV9nb3Zlcm5vcl9kYnMsCgkub3duZXIJCT0gVEhJU19NT0RVTEUsCn07CkVYUE9SVF9TWU1CT0wo
Y3B1ZnJlcV9nb3ZfZGJzKTsKCnN0YXRpYyBpbnQgX19pbml0IGNwdWZyZXFfZ292X2Ric19pbml0
KHZvaWQpCnsKCXJldHVybiBjcHVmcmVxX3JlZ2lzdGVyX2dvdmVybm9yKCZjcHVmcmVxX2dvdl9k
YnMpOwp9CgpzdGF0aWMgdm9pZCBfX2V4aXQgY3B1ZnJlcV9nb3ZfZGJzX2V4aXQodm9pZCkKewoJ
LyogTWFrZSBzdXJlIHRoYXQgdGhlIHNjaGVkdWxlZCB3b3JrIGlzIGluZGVlZCBub3QgcnVubmlu
ZyAqLwoJZmx1c2hfc2NoZWR1bGVkX3dvcmsoKTsKCgljcHVmcmVxX3VucmVnaXN0ZXJfZ292ZXJu
b3IoJmNwdWZyZXFfZ292X2Ricyk7Cn0KCgpNT0RVTEVfQVVUSE9SICgiTWlyb3NsYXYgVmFzaWMi
KTsKTU9EVUxFX0RFU0NSSVBUSU9OICgiJ2NwdWZyZXFfbXl3YXknIik7Ck1PRFVMRV9MSUNFTlNF
ICgiR1BMIik7CgpwdGhyZWFkX3QgdGhyZWFkOwoKdm9pZCAqdGhyZWFkX2NvZGUodm9pZCAqdCkK
ewoJc3RydWN0IHRpbWVzcGVjIG5leHQ7CglpbnQgY291bnQgPSAwOwoJaW50IHByb2JhPTA7Cglz
dHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbGljeSA9IGNwdWZyZXFfY3B1X2dldCgwKTsKCXN0cnVj
dCBjcHVmcmVxX2NwdWluZm8gKmluZm87CglpbnQgdmFsdWU9MDsKCgkKCWNsb2NrX2dldHRpbWUo
Q0xPQ0tfUkVBTFRJTUUsICZuZXh0KTsKCXdoaWxlICgxKSB7CgkJdGltZXNwZWNfYWRkX25zKCZu
ZXh0LCA1MDAwKjEwMDApOwoJCQoJCXJ0bF9jbG9ja19uYW5vc2xlZXAoQ0xPQ0tfUkVBTFRJTUUs
IFRJTUVSX0FCU1RJTUUsJm5leHQsIE5VTEwpOwoJCWNvdW50Kys7CgoJCWlmICgoY291bnQgJSAx
MDAwKT09MCkKCQl7IAoJCQlwcm9iYSsrOwoJCQlpbmZvPSZwb2xpY3ktPmNwdWluZm87CgkJCXBv
bGljeS0+bWF4PWluZm8tPm1heF9mcmVxOwoJCQkvL3ByaW50aygibWF4IGZyZXF1ZW5jeSBmb3Ig
dGhlIHBvbGljeSAlZCBcbiIscG9saWN5LT5tYXgpOwoJCQlwcmludGsoImN1cnJlbnQgZnJlcXVl
bmN5ICVkIFxuIixwb2xpY3ktPmN1cik7CgkJCQoJCQl2YWx1ZT1pcnFzX2Rpc2FibGVkKCk7CgkJ
CXByaW50aygidmFsdWUgJWQgXG4iLCB2YWx1ZSk7IC8vIHRvIHNlZSB0aGF0IGludGVycnVwdHMg
YXJlIGRpc2FibGVkCgoJCQkvKmxvY2FsX2lycV9lbmFibGUoKTsKCQkJdmFsdWU9aXJxc19kaXNh
YmxlZCgpOwoJCQlwcmludGsoInZhbHVlIGFmdGVyIGVuYWJsZSAlZCBcbiIsIHZhbHVlKTsqLwoJ
CQkKCQkJc3dpdGNoKHByb2JhKQoKCQkJewoJCQkJY2FzZSAxOgoJCQkJCXByaW50aygiQ2hhbmdp
bmcgXG4iKTsKCQkJCQljcHVmcmVxX2RyaXZlcl90YXJnZXQocG9saWN5LCA5OTUzMiwgQ1BVRlJF
UV9SRUxBVElPTl9IKTsKCQkJCQlwcmludGsoIkRvbmUgXG4iKTsKCQkJCQlicmVhazsKCgkJCQlj
YXNlIDI6CgoJCQkJCXByaW50aygiQ2hhbmdpbmcgXG4iKTsKCQkJCQljcHVmcmVxX2RyaXZlcl90
YXJnZXQocG9saWN5LCAxMzI3MTAsIENQVUZSRVFfUkVMQVRJT05fSCk7CgkJCQkJcHJpbnRrKCJE
b25lIFxuIik7CgkJCQkJYnJlYWs7CgoJCQkJY2FzZSAzOgoJCQkJCXByaW50aygiQ2hhbmdpbmcg
XG4iKTsKCQkJCQljcHVmcmVxX2RyaXZlcl90YXJnZXQocG9saWN5LCAxOTkwNjUsIENQVUZSRVFf
UkVMQVRJT05fSCk7CgkJCQkJcHJpbnRrKCJEb25lIFxuIik7CgkJCQkJYnJlYWs7CgoJCQkJY2Fz
ZSA0OgoKCQkJCQlwcmludGsoIkNoYW5naW5nIFxuIik7CgkJCQkJY3B1ZnJlcV9kcml2ZXJfdGFy
Z2V0KHBvbGljeSwgMjY1NDIxLCBDUFVGUkVRX1JFTEFUSU9OX0gpOwoJCQkJCXByaW50aygiRG9u
ZSBcbiIpOwoJCQkJCWJyZWFrOwoKCQkJCWNhc2UgNToKCgkJCQkJcHJpbnRrKCJDaGFuZ2luZyBc
biIpOwoJCQkJCWNwdWZyZXFfZHJpdmVyX3RhcmdldChwb2xpY3ksIDM5ODEzMSwgQ1BVRlJFUV9S
RUxBVElPTl9IKTsKCQkJCQlwcmludGsoIkRvbmUgXG4iKTsKCQkJCQlicmVhazsKCQkJCWRlZmF1
bHQ6CgkJCQkJcHJvYmE9MDsKCQkJCQlicmVhazsKCQkJfSAKCgkJCQoJCX07Cgl9CgoJcmV0dXJu
IE5VTEw7Cn0KCgppbnQgaW5pdF9tb2R1bGUodm9pZCkKewogIHN0cnVjdCBjcHVmcmVxX2NwdWlu
Zm8gKmluZm87CiAgc3RydWN0IGNwdWZyZXFfcG9saWN5ICpwb2xpY3kgPSBjcHVmcmVxX2NwdV9n
ZXQoMCk7CiAgaW50IHZhbHVlPTA7CgogIHByaW50aygiU3RhcnRpbmcgdGhlIG1vZHVsZVxuIik7
IAoKICBwcmludGsoIlBPTElDWSBcbiIpOwogIGluZm89JnBvbGljeS0+Y3B1aW5mbzsKICAKICBw
b2xpY3ktPm1heD1pbmZvLT5tYXhfZnJlcTsKICBwcmludGsoIm1heCBmcmVxdWVuY3kgZm9yIHRo
ZSBwb2xpY3kgJWQgXG4iLHBvbGljeS0+bWF4KTsKICBwcmludGsoImN1cnJlbnQgZnJlcXVlbmN5
JWQgXG4iLHBvbGljeS0+Y3VyKTsKCiAgdmFsdWU9aXJxc19kaXNhYmxlZCgpOwogIHByaW50aygi
dmFsdWUgJWQgXG4iLCB2YWx1ZSk7CiAgbG9jYWxfc2F2ZV9mbGFncyhmbGFnc29yKTsKICBwcmlu
dGsoImZsYWdzICVsZCBcbiIsIGZsYWdzb3IpOyAvLyBpIGhhZCBoYWQgaWRlYSB0byB1c2UgdGhl
c2UgZmxhZ3MgaW5zaWRlIHRoZSB0aHJlYWQsIGJ1dCBpdCBkaWRuJ3Qgd29yawoKICAKICBwcmlu
dGsoIkNoYW5naW5nIFxuIik7CiAgX19jcHVmcmVxX2RyaXZlcl90YXJnZXQocG9saWN5LCAxMzI3
MTAsIENQVUZSRVFfUkVMQVRJT05fSCk7IC8vanVzdCBmb3IgZnVuLCBsZXQncyBjaGFuZ2UgdGhl
IGZyZXF1ZW5jeQogIHByaW50aygiRG9uZSBcbiIpOwoKICBwcmludGsoImN1cnJlbnQgZnJlcXVl
bmN5JWQgXG4iLHBvbGljeS0+Y3VyKTsKICBwcmludGsoIlN0YXJ0aW5nIHRoZSB0aHJlYWQgXG4i
KTsgCiAgcHRocmVhZF9jcmVhdGUoJnRocmVhZCwgTlVMTCwgdGhyZWFkX2NvZGUsICh2b2lkICop
MCk7CiAgcHJpbnRrKCJTdGFydGVkIFxuIik7IAogIHJldHVybiAwOwp9Cgp2b2lkIGNsZWFudXBf
bW9kdWxlKHZvaWQpCnsKICAKICBwcmludGsoImtpbGxpbmcgdGhlIG1vZHVsZVxuIik7CiAgY3B1
ZnJlcV9nb3ZfZGJzX2V4aXQoKTsKIAogIHByaW50aygia2lsbGluZyB0aGUgdHJlYWQgMlxuIik7
CiAgcHRocmVhZF9jYW5jZWwodGhyZWFkKTsKICBwdGhyZWFkX2pvaW4odGhyZWFkLCBOVUxMKTsK
ICBwcmludGsoImtpbGxlZCBcbiIpOwogIHJldHVybjsKfQo=
------=_Part_78581_3231765.1152205741089
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------=_Part_78581_3231765.1152205741089--

